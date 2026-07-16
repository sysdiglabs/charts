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
      {{- if and (eq .Values.config.registryType "acr") .Values.config.acr_workloadidentity }}
      initContainers:
      - name: aad-token-fetcher
        image: {{ include "registry-scanner.initContainerImage" . }}
        imagePullPolicy: {{ .Values.image.initContainerPullPolicy | default .Values.image.pullPolicy }}
        command:
          - /bin/sh
          - -c
          - |
            set -e
            # Fetch AAD token from IMDS for ACR
            REGISTRY_URL="{{ .Values.config.registryURL }}"
            ENDPOINT="http://169.254.169.254/metadata/identity/oauth2/token?api-version=2017-09-01&resource=https://${REGISTRY_URL}"
            
            MAX_RETRIES=5
            RETRY_COUNT=0
            while [ $RETRY_COUNT -lt $MAX_RETRIES ]; do
              if TOKEN=$(curl -s -H "Metadata:true" "$ENDPOINT" 2>/dev/null | grep -o '"access_token":"[^"]*' | cut -d'"' -f4); then
                if [ -n "$TOKEN" ]; then
                  echo "$TOKEN" > /aad-token/token
                  echo "AAD token fetched successfully"
                  exit 0
                fi
              fi
              RETRY_COUNT=$((RETRY_COUNT + 1))
              if [ $RETRY_COUNT -lt $MAX_RETRIES ]; then
                echo "Retrying IMDS token fetch ($RETRY_COUNT/$MAX_RETRIES)..."
                sleep 2
              fi
            done
            echo "Failed to fetch AAD token after $MAX_RETRIES attempts"
            exit 1
        volumeMounts:
        - name: aad-token
          mountPath: /aad-token
        securityContext:
          runAsNonRoot: true
          runAsUser: 65534
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
        {{- if and (eq .Values.config.registryType "acr") .Values.config.acr_workloadidentity }}
        - name: aad-token
          mountPath: /aad-token
        {{- end }}
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
            {{- if and (eq .Values.config.registryType "acr") .Values.config.acr_workloadidentity }}
            value: ""
            {{- else }}
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
          {{- if and (eq .Values.config.registryType "acr") .Values.config.acr_workloadidentity }}
          - name: REGISTRYSCANNER_REGISTRY_PASSWORD_FILE
            value: /aad-token/token
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
      {{- if and (eq .Values.config.registryType "acr") .Values.config.acr_workloadidentity }}
      - name: aad-token
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
