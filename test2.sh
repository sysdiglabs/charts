helm install node-analyzer ./charts/node-analyzer --namespace sysdig-agent \
    --set sysdig.accessKey=5d09073e-cf03-43be-b4a8-60ce56144a1b \
    --set sysdig.settings.collector=ingest-us2.app.sysdig.com \
    --set sysdig.settings.collector_port=6443 \
    --set clusterName=a1exv-sbx-01.blackcase.org \
    --set nodeAnalyzer.apiEndpoint=us2.app.sysdig.com \
    --set nodeAnalyzer.hostAnalyzer.deploy=false
