{{- define "registry-scanner.jobTemplate" }}
  backoffLimit: 0
  {{- if .Values.config.scan.orchestrator.ttlSecondsAfterFinished }}
  ttlSecondsAfterFinished: {{ .Values.config.scan.orchestrator.ttlSecondsAfterFinished }}
  {{- end }}
  template:
    metadata:
      name: {{ include "registry-scanner.fullname" . }}
      labels:
        {{- include "registry-scanner.labels" . | nindent 12 }}
        {{- include "registry-scanner.customLabels" . | nindent 12 }}
      {{- with .Values.podAnnotations }}
      annotations:
        {{- toYaml . | nindent 12 }}
      {{- end }}
    spec:
      {{- with .Values.imagePullSecrets }}
      imagePullSecrets:
        {{- toYaml . | nindent 12 }}
      {{- end }}
      serviceAccountName: {{ include "registry-scanner.serviceAccountName" . }}
      securityContext:
        {{- toYaml .Values.podSecurityContext | nindent 12 }}
      {{- if eq .Values.config.registryType "gitlab" }}
      initContainers:
      - name: gitlab-proxy-deps
        image: "{{ .Values.config.gitlab.proxyImage.repository }}:{{ .Values.config.gitlab.proxyImage.tag }}"
        imagePullPolicy: {{ .Values.config.gitlab.proxyImage.pullPolicy }}
        command: ["pip", "install", "--no-cache-dir", "--target=/deps",
                  "flask>=3.0,<4", "requests>=2.32,<3", "gunicorn>=22,<24"]
        volumeMounts:
        - name: gitlab-proxy-deps
          mountPath: /deps
      {{- end }}
      containers:
      - name: {{ .Chart.Name }}
        securityContext:
          {{- toYaml .Values.securityContext | nindent 14 }}
        image: {{ include "registry-scanner.image" . }}
        args: [ "--scan_runner=new-vm-scanner-k8s-job"]
        imagePullPolicy: {{ .Values.image.pullPolicy }}
        resources:
          {{- toYaml .Values.resources | nindent 14 }}
        volumeMounts:
        - name: config-volume
          mountPath: /config.yaml
          subPath: config.yaml
        {{- if .Values.reportToPersistentVolumeClaim }}
        - name: report-storage
          mountPath: "/output"
        {{- end }}
        {{- if .Values.memProfileToPersistentVolumeClaim }}
        - name: profile-storage
          mountPath: "/profiling"
        {{- end }}
        {{- if .Values.ssl.ca.certs }}
        - name: ca-certs
          mountPath: "/ca-certs"
        {{- end }}
        env:
          - name: SECURE_API_TOKEN
            valueFrom:
              secretKeyRef:
                {{- if not .Values.existingSecretName }}
                name: {{ include "registry-scanner.fullname" . }}
                {{- else }}
                name: {{ .Values.existingSecretName }}
                {{- end }}
                key: secureAPIToken
          {{- if .Values.proxy.httpProxy }}
          - name: http_proxy
            value: {{ .Values.proxy.httpProxy }}
          {{- end }}
          {{- if .Values.proxy.httpsProxy }}
          - name: https_proxy
            value: {{ .Values.proxy.httpsProxy }}
          {{- end }}
          {{- if .Values.proxy.noProxy }}
          - name: no_proxy
            value: {{ .Values.proxy.noProxy }}
          {{- end }}
          {{- if .Values.ssl.ca.certs }}
          - name: SSL_CERT_DIR
            value: "/ca-certs"
          {{- end }}
          {{- if eq .Values.config.registryType "ecr" }}
          - name: AWS_ACCESS_KEY_ID
            {{- if contains "true" (include "registry-scanner.eksWithSA" .)}}
            value: ""
            {{- else }}
            valueFrom:
              secretKeyRef:
                {{- if not .Values.existingSecretName }}
                name: {{ include "registry-scanner.fullname" . }}
                {{- else }}
                name: {{ .Values.existingSecretName }}
                {{- end }}
                key: aws_access_key_id
            {{- end }}
          - name: AWS_SECRET_ACCESS_KEY
            {{- if contains "true" (include "registry-scanner.eksWithSA" .)}}
            value: ""
            {{- else }}
            valueFrom:
              secretKeyRef:
                {{- if not .Values.existingSecretName }}
                name: {{ include "registry-scanner.fullname" . }}
                {{- else }}
                name: {{ .Values.existingSecretName }}
                {{- end }}
                key: aws_secret_access_key
            {{- end }}
          - name: AWS_REGION
            valueFrom:
              secretKeyRef:
                {{- if not .Values.existingSecretName }}
                name: {{ include "registry-scanner.fullname" . }}
                {{- else }}
                name: {{ .Values.existingSecretName }}
                {{- end }}
                key: aws_region
          {{- else }}
          - name: REGISTRYSCANNER_REGISTRY_USER
            valueFrom:
              secretKeyRef:
                {{- if not .Values.existingSecretName }}
                name: {{ include "registry-scanner.fullname" . }}
                {{- else }}
                name: {{ .Values.existingSecretName }}
                {{- end }}
                key: registryUser
          {{- if ne .Values.config.registryType "ocp" }}
          - name: REGISTRYSCANNER_REGISTRY_PASSWORD
            valueFrom:
              secretKeyRef:
                {{- if not .Values.existingSecretName }}
                name: {{ include "registry-scanner.fullname" . }}
                {{- else }}
                name: {{ .Values.existingSecretName }}
                {{- end }}
                key: registryPassword
          {{- end }}
          {{- end }}
          {{ if .Values.config.parallelGoRoutines }}
          - name: GROUP_LIMIT
            value: "{{ .Values.config.parallelGoRoutines }}"
          {{- end }}
          {{- if .Values.memProfileToPersistentVolumeClaim }}
          - name: REGISTRYSCANNER_PROFILING_ENABLED
            value: /profiling
          {{- end }}
          - name: REGISTRYSCANNER_CRONJOB_SCHEDULE
            value: {{ .Values.cronjob.schedule | quote }}
          {{- if .Values.extraEnvVars }}
          {{- toYaml .Values.extraEnvVars | nindent 10 }}
          {{- end }}
      {{- if eq .Values.config.registryType "gitlab" }}
      - name: gitlab-registry-proxy
        image: "{{ .Values.config.gitlab.proxyImage.repository }}:{{ .Values.config.gitlab.proxyImage.tag }}"
        imagePullPolicy: {{ .Values.config.gitlab.proxyImage.pullPolicy }}
        workingDir: /app
        command:
          - /bin/sh
          - -c
          - |
            exec /deps/bin/gunicorn \
              --workers 2 \
              --bind "0.0.0.0:{{ default 5000 .Values.config.gitlab.proxyPort }}" \
              --timeout 120 \
              --access-logfile - \
              app:app
        env:
          - name: GITLAB_URL
            value: {{ required "config.gitlab.url is required when registryType is gitlab" .Values.config.gitlab.url | quote }}
          - name: GITLAB_REGISTRY_HOST
            value: {{ required "config.gitlab.registryHost is required when registryType is gitlab" .Values.config.gitlab.registryHost | quote }}
          - name: GITLAB_GROUPS
            value: {{ default "" .Values.config.gitlab.groups | quote }}
          - name: GITLAB_SKIP_TLS
            value: {{ default false .Values.config.gitlab.skipTLS | quote }}
          - name: GITLAB_TOKEN
            valueFrom:
              secretKeyRef:
                {{- if not .Values.existingSecretName }}
                name: {{ include "registry-scanner.fullname" . }}
                {{- else }}
                name: {{ .Values.existingSecretName }}
                {{- end }}
                key: gitlabToken
          - name: PROXY_USER
            valueFrom:
              secretKeyRef:
                {{- if not .Values.existingSecretName }}
                name: {{ include "registry-scanner.fullname" . }}
                {{- else }}
                name: {{ .Values.existingSecretName }}
                {{- end }}
                key: registryUser
          - name: PROXY_PASSWORD
            valueFrom:
              secretKeyRef:
                {{- if not .Values.existingSecretName }}
                name: {{ include "registry-scanner.fullname" . }}
                {{- else }}
                name: {{ .Values.existingSecretName }}
                {{- end }}
                key: registryPassword
          - name: CACHE_TTL_SECS
            value: {{ default 300 .Values.config.gitlab.cacheTTLSeconds | quote }}
          - name: TOKEN_TTL_SECS
            value: {{ default 240 .Values.config.gitlab.tokenTTLSeconds | quote }}
          - name: PROXY_PORT
            value: {{ default 5000 .Values.config.gitlab.proxyPort | quote }}
          - name: LOG_LEVEL
            value: {{ .Values.config.logging | upper | quote }}
          - name: PYTHONPATH
            value: "/deps"
        ports:
          - name: gl-proxy
            containerPort: {{ default 5000 .Values.config.gitlab.proxyPort }}
            protocol: TCP
        livenessProbe:
          httpGet:
            path: /health
            port: gl-proxy
          initialDelaySeconds: 60
          periodSeconds: 30
          timeoutSeconds: 10
          failureThreshold: 3
        readinessProbe:
          httpGet:
            path: /health
            port: gl-proxy
          initialDelaySeconds: 20
          periodSeconds: 10
          timeoutSeconds: 5
          failureThreshold: 3
        volumeMounts:
        - name: gitlab-proxy-script
          mountPath: /app
        - name: gitlab-proxy-deps
          mountPath: /deps
      {{- end }}
      restartPolicy: {{ .Values.cronjob.restartPolicy }}
      {{- with .Values.nodeSelector }}
      nodeSelector:
        {{- toYaml . | nindent 12 }}
      {{- end }}
      {{- with .Values.affinity }}
      affinity:
        {{- toYaml . | nindent 12 }}
      {{- end }}
      {{- with .Values.tolerations }}
      tolerations:
        {{- toYaml . | nindent 12 }}
      {{- end }}
      volumes:
      - name: config-volume
        configMap:
          name: {{ include "registry-scanner.fullname" . }}
      {{- if eq .Values.config.registryType "gitlab" }}
      - name: gitlab-proxy-script
        configMap:
          name: {{ include "registry-scanner.fullname" . }}
          items:
            - key: gitlab-proxy.py
              path: app.py
          defaultMode: 0444
      - name: gitlab-proxy-deps
        emptyDir: {}
      {{- end }}
      {{- if .Values.ssl.ca.certs }}
      - name: ca-certs
        projected:
          sources:
            {{- range $index, $cert := .Values.ssl.ca.certs }}
            - secret:
                name: {{ include "registry-scanner.fullname" $ }}-ca-{{$index}}
            {{- end }}
      {{- end }}
      {{- if .Values.reportToPersistentVolumeClaim }}
      - name: report-storage
        persistentVolumeClaim:
          claimName: {{ .Values.reportToPersistentVolumeClaim }}
      {{- end }}
      {{- if .Values.memProfileToPersistentVolumeClaim }}
      - name: profile-storage
        persistentVolumeClaim:
          claimName: {{ .Values.memProfileToPersistentVolumeClaim }}
      {{- end }}
{{- end }}
