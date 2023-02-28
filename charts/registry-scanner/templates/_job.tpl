{{- define "registry-scanner.jobTemplate" }}
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
      serviceAccountName: {{ include "registry-scanner.fullname" . }}
      securityContext:
        {{- toYaml .Values.podSecurityContext | nindent 12 }}
      containers:
      - name: {{ .Chart.Name }}
        securityContext:
          {{- toYaml .Values.securityContext | nindent 14 }}
        image: {{ include "registry-scanner.image" . }}
        {{- if .Values.config.scan.newVmScanner }}
        args: [ "--scan_runner=new-vm-scanner" ]
        {{- else}}
        args: [ "--scan_runner=k8sjob" ]
        {{- end }}
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
          - name: SHOW_USAGE
            value: false
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