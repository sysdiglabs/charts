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
        {{- if and (eq .Values.config.registryType "acr") .Values.config.acr_workloadidentity }}
            azure.workload.identity/use: "true"
        {{- end }}
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
            # Obtain an ACR refresh token as the *federated* managed identity (the UAMI in the
            # service account's azure.workload.identity/client-id annotation), NOT the node/kubelet
            # identity. The azure-workload-identity webhook injects AZURE_CLIENT_ID / AZURE_TENANT_ID /
            # AZURE_FEDERATED_TOKEN_FILE because the pod carries azure.workload.identity/use=true.
            REGISTRY_URL="{{ .Values.config.registryURL }}"
            : "${AZURE_CLIENT_ID:?workload identity not injected (AZURE_CLIENT_ID unset) - check the SA azure.workload.identity/client-id annotation and the azure.workload.identity/use pod label}"
            : "${AZURE_TENANT_ID:?workload identity not injected (AZURE_TENANT_ID unset)}"
            : "${AZURE_FEDERATED_TOKEN_FILE:?workload identity not injected (AZURE_FEDERATED_TOKEN_FILE unset)}"
            AUTHORITY_HOST="${AZURE_AUTHORITY_HOST:-https://login.microsoftonline.com/}"

            fetch_token() {
              FED_TOKEN="$(cat "$AZURE_FEDERATED_TOKEN_FILE")"
              # 1) Federated client-assertion exchange -> AAD access token. ACR with
              #    azureAdAuthenticationAsArmPolicy enabled expects the ARM audience; a token for
              #    the ACR-specific audience yields a refresh token that lacks registry:catalog:*.
              AAD_TOKEN="$(curl -s -X POST \
                "${AUTHORITY_HOST}${AZURE_TENANT_ID}/oauth2/v2.0/token" \
                -H 'Content-Type: application/x-www-form-urlencoded' \
                --data-urlencode "client_id=${AZURE_CLIENT_ID}" \
                --data-urlencode 'grant_type=client_credentials' \
                --data-urlencode 'client_assertion_type=urn:ietf:params:oauth:client-assertion-type:jwt-bearer' \
                --data-urlencode "client_assertion=${FED_TOKEN}" \
                --data-urlencode 'scope=https://management.azure.com/.default' \
                | grep -o '"access_token":"[^"]*' | cut -d'"' -f4)"
              [ -n "$AAD_TOKEN" ] || return 1
              # 2) Exchange the AAD token for an ACR refresh token (the docker password used with the
              #    null-GUID username the chart sets as registryUser).
              ACR_TOKEN="$(curl -s -X POST \
                "https://${REGISTRY_URL}/oauth2/exchange" \
                -H 'Content-Type: application/x-www-form-urlencoded' \
                --data-urlencode 'grant_type=access_token' \
                --data-urlencode "service=${REGISTRY_URL}" \
                --data-urlencode "tenant=${AZURE_TENANT_ID}" \
                --data-urlencode "access_token=${AAD_TOKEN}" \
                | grep -o '"refresh_token":"[^"]*' | cut -d'"' -f4)"
              [ -n "$ACR_TOKEN" ] || return 1
              printf '%s' "$ACR_TOKEN" > /aad-token/token
            }

            MAX_RETRIES=5
            RETRY_COUNT=0
            while [ $RETRY_COUNT -lt $MAX_RETRIES ]; do
              if fetch_token; then
                echo "ACR refresh token obtained via workload identity"
                exit 0
              fi
              RETRY_COUNT=$((RETRY_COUNT + 1))
              [ $RETRY_COUNT -lt $MAX_RETRIES ] && { echo "Retrying ACR token fetch ($RETRY_COUNT/$MAX_RETRIES)..."; sleep 2; }
            done
            echo "Failed to obtain ACR token via workload identity after $MAX_RETRIES attempts" >&2
            exit 1
        volumeMounts:
        - name: aad-token
          mountPath: /aad-token
        securityContext:
          allowPrivilegeEscalation: false
          capabilities:
            drop:
              - ALL
          readOnlyRootFilesystem: true
          runAsNonRoot: true
          runAsUser: 65534
          runAsGroup: 65534
          seccompProfile:
            type: RuntimeDefault
      {{- end }}
      containers:
      - name: {{ .Chart.Name }}
        securityContext:
          {{- toYaml .Values.securityContext | nindent 14 }}
        image: {{ include "registry-scanner.image" . }}
        {{- if and (eq .Values.config.registryType "acr") .Values.config.acr_workloadidentity }}
        # The scanner binary ignores REGISTRYSCANNER_REGISTRY_PASSWORD_FILE; load the WIF-minted ACR
        # token that the init container wrote into the password env, then exec the scanner.
        command: ["/bin/sh", "-c", "export REGISTRYSCANNER_REGISTRY_PASSWORD=\"$(cat /aad-token/token)\"; exec /registry-scanner \"$@\"", "registry-scanner"]
        args: ["--scan_runner=new-vm-scanner-k8s-job"]
        {{- else }}
        args: [ "--scan_runner=new-vm-scanner-k8s-job"]
        {{- end }}
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
