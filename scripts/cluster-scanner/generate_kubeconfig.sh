#!/bin/bash
set pipefail

# Update these to match your environment

SERVICE_ACCOUNT_NAME=${SERVICE_ACCOUNT_NAME:-sysdig-cluster-scanner}
CONTEXT=$(kubectl config current-context)
NAMESPACE=${NAMESPACE:-sysdig-cluster-scanner}

NEW_CONTEXT=${CLUSTER_NAME_OVERRIDE:-$(kubectl config view --minify -o jsonpath='{.clusters[].name}' | tr :/ -)}
KUBECONFIG_FILE=${KUBECONFIG_FILE:-"${NEW_CONTEXT}.kubeconfig"}

SECRET_NAME=sysdig-cluster-scanner
TOKEN_DATA=$(kubectl get secret ${SECRET_NAME} \
  --context ${CONTEXT} \
  --namespace ${NAMESPACE} \
  -o jsonpath='{.data.token}')

TOKEN=$(echo ${TOKEN_DATA} | base64 -d)

# Create dedicated kubeconfig
# Create a full copy
kubectl config view --raw > ${KUBECONFIG_FILE}.full.tmp
# Switch working context to correct context
kubectl --kubeconfig ${KUBECONFIG_FILE}.full.tmp config use-context ${CONTEXT}
# Minify
kubectl --kubeconfig ${KUBECONFIG_FILE}.full.tmp \
  config view --flatten --minify > ${KUBECONFIG_FILE}.tmp

# Optional, rename cluster with yq
if [[ ! -z "${CLUSTER_NAME_OVERRIDE}" ]]; then
  yq e -i ".contexts[0].context.cluster = \"${CLUSTER_NAME_OVERRIDE}\"" ${KUBECONFIG_FILE}.tmp
  yq e -i ".clusters[0].name = \"${CLUSTER_NAME_OVERRIDE}\"" ${KUBECONFIG_FILE}.tmp
fi

# Optional, rename context if differs
if [[ "$CONTEXT" != "$NEW_CONTEXT" ]]; then
  kubectl config --kubeconfig ${KUBECONFIG_FILE}.tmp \
    rename-context ${CONTEXT} ${NEW_CONTEXT}
fi

# Create token user
kubectl config --kubeconfig ${KUBECONFIG_FILE}.tmp \
  set-credentials ${CONTEXT}-${NAMESPACE}-token-user \
  --token ${TOKEN}
# Set context to use token user
kubectl config --kubeconfig ${KUBECONFIG_FILE}.tmp \
  set-context ${NEW_CONTEXT} --user ${CONTEXT}-${NAMESPACE}-token-user
# Set context to correct namespace
kubectl config --kubeconfig ${KUBECONFIG_FILE}.tmp \
  set-context ${NEW_CONTEXT} --namespace ${NAMESPACE}
# Flatten/minify kubeconfig
kubectl config --kubeconfig ${KUBECONFIG_FILE}.tmp \
  view --flatten --minify > ${KUBECONFIG_FILE}
# Remove tmp
rm ${KUBECONFIG_FILE}.full.tmp
rm ${KUBECONFIG_FILE}.tmp
