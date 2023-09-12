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
            valueFrom:
              secretKeyRef:
                {{- if not .Values.existingSecretName }}
                name: {{ include "registry-scanner.fullname" . }}
                {{- else }}
                name: {{ .Values.existingSecretName }}
                {{- end }}
                key: aws_access_key_id
          - name: AWS_SECRET_ACCESS_KEY
            valueFrom:
              secretKeyRef:
                {{- if not .Values.existingSecretName }}
                name: {{ include "registry-scanner.fullname" . }}
                {{- else }}
                name: {{ .Values.existingSecretName }}
                {{- end }}
                key: aws_secret_access_key
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
{{- end }}

{{- define "registry-scanner.jobTemplateGar" }}
{{- $top := index . 0 }}
{{- $context := index . 1 }}
  backoffLimit: 0
  {{- if $top.Values.config.scan.orchestrator.ttlSecondsAfterFinished }}
  ttlSecondsAfterFinished: {{ $top.Values.config.scan.orchestrator.ttlSecondsAfterFinished }}
  {{- end }}
  template:
    metadata:
      name: {{ include "registry-scanner.fullname" $top }}-gar-{{ $context }}
      labels:
        {{- include "registry-scanner.labels" $top | nindent 12 }}
        {{- include "registry-scanner.customLabels" $top | nindent 12 }}
      {{- with $top.Values.podAnnotations }}
      annotations:
        {{- toYaml $top | nindent 12 }}
      {{- end }}
    spec:
      {{- with $top.Values.imagePullSecrets }}
      imagePullSecrets:
        {{- toYaml $top | nindent 12 }}
      {{- end }}
      serviceAccountName: {{ include "registry-scanner.serviceAccountName" $top }}
      securityContext:
        {{- toYaml $top.Values.podSecurityContext | nindent 12 }}
      containers:
      - name: {{ $top.Chart.Name }}
        securityContext:
          {{- toYaml $top.Values.securityContext | nindent 14 }}
        image: {{ include "registry-scanner.image" $top }}
        args: [ "--scan_runner=new-vm-scanner-k8s-job","--registry_url {{ $context }}-docker.pkg.dev"]
        imagePullPolicy: {{ $top.Values.image.pullPolicy }}
        resources:
          {{- toYaml $top.Values.resources | nindent 14 }}
        volumeMounts:
        - name: config-volume
          mountPath: /config.yaml
          subPath: config.yaml
        {{- if $top.Values.reportToPersistentVolumeClaim }}
        - name: report-storage
          mountPath: "/output"
        {{- end }}
        {{- if $top.Values.ssl.ca.certs }}
        - name: ca-certs
          mountPath: "/ca-certs"
        {{- end }}
        env:
          - name: SECURE_API_TOKEN
            valueFrom:
              secretKeyRef:
                {{- if not $top.Values.existingSecretName }}
                name: {{ include "registry-scanner.fullname" $top }}
                {{- else }}
                name: {{ $top.Values.existingSecretName }}
                {{- end }}
                key: secureAPIToken
          {{- if $top.Values.proxy.httpProxy }}
          - name: http_proxy
            value: {{ $top.Values.proxy.httpProxy }}
          {{- end }}
          {{- if $top.Values.proxy.httpsProxy }}
          - name: https_proxy
            value: {{ $top.Values.proxy.httpsProxy }}
          {{- end }}
          {{- if $top.Values.proxy.noProxy }}
          - name: no_proxy
            value: {{ $top.Values.proxy.noProxy }}
          {{- end }}
          {{- if $top.Values.ssl.ca.certs }}
          - name: SSL_CERT_DIR
            value: "/ca-certs"
          {{- end }}
          {{- if eq $top.Values.config.registryType "ecr" }}
          - name: AWS_ACCESS_KEY_ID
            valueFrom:
              secretKeyRef:
                {{- if not $top.Values.existingSecretName }}
                name: {{ include "registry-scanner.fullname" $top }}
                {{- else }}
                name: {{ $top.Values.existingSecretName }}
                {{- end }}
                key: aws_access_key_id
          - name: AWS_SECRET_ACCESS_KEY
            valueFrom:
              secretKeyRef:
                {{- if not $top.Values.existingSecretName }}
                name: {{ include "registry-scanner.fullname" $top }}
                {{- else }}
                name: {{ $top.Values.existingSecretName }}
                {{- end }}
                key: aws_secret_access_key
          - name: AWS_REGION
            valueFrom:
              secretKeyRef:
                {{- if not $top.Values.existingSecretName }}
                name: {{ include "registry-scanner.fullname" $top }}
                {{- else }}
                name: {{ $top.Values.existingSecretName }}
                {{- end }}
                key: aws_region
          {{- else }}
          - name: REGISTRYSCANNER_REGISTRY_USER
            valueFrom:
              secretKeyRef:
                {{- if not $top.Values.existingSecretName }}
                name: {{ include "registry-scanner.fullname" $top }}
                {{- else }}
                name: {{ $top.Values.existingSecretName }}
                {{- end }}
                key: registryUser
          - name: REGISTRYSCANNER_REGISTRY_PASSWORD
            valueFrom:
              secretKeyRef:
                {{- if not $top.Values.existingSecretName }}
                name: {{ include "registry-scanner.fullname" $top }}
                {{- else }}
                name: {{ $top.Values.existingSecretName }}
                {{- end }}
                key: registryPassword
          {{- end }}
          {{- if $top.Values.extraEnvVars }}
          {{- toYaml $top.Values.extraEnvVars | nindent 10 }}
          {{- end }}
      restartPolicy: {{ $top.Values.cronjob.restartPolicy }}
      {{- with $top.Values.nodeSelector }}
      nodeSelector:
        {{- toYaml $top | nindent 12 }}
      {{- end }}
      {{- with $top.Values.affinity }}
      affinity:
        {{- toYaml $top | nindent 12 }}
      {{- end }}
      {{- with $top.Values.tolerations }}
      tolerations:
        {{- toYaml $top | nindent 12 }}
      {{- end }}
      volumes:
      - name: config-volume
        configMap:
          name: {{ include "registry-scanner.fullname" $top }}
      {{- if $top.Values.ssl.ca.certs }}
      - name: ca-certs
        projected:
          sources:
            {{- range $index, $cert := $top.Values.ssl.ca.certs }}
            - secret:
                name: {{ include "registry-scanner.fullname" $top }}-ca-{{$index}}
            {{- end }}
      {{- end }}
      {{- if $top.Values.reportToPersistentVolumeClaim }}
      - name: report-storage
        persistentVolumeClaim:
          claimName: {{ $top.Values.reportToPersistentVolumeClaim }}
      {{- end }}
{{- end }}
