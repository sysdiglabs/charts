# Build the manager binary
FROM quay.io/operator-framework/helm-operator:v1.39.1

ARG RELEASE_VERSION

LABEL name="rh-shield-operator" \
      vendor="Sysdig" \
      maintainer="Sysdig" \
      version="${RELEASE_VERSION}" \
      release="1" \
      summary="Operator based on the shield chart by Sysdig" \
      description="Operator based on the shield Helm chart by Sysdig for the installation and management of the Cluster and Host Shield components."
COPY LICENSE /licenses/

ENV HOME=/opt/helm
COPY watches.yaml ${HOME}/watches.yaml
COPY helm-charts  ${HOME}/helm-charts
WORKDIR ${HOME}
