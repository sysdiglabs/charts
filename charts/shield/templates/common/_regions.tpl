{{- define "common.regions" -}}
  {{- $regions := dict "au1" (dict "collector_endpoint"  "ingest.au1.sysdig.com"
                                   "monitor_api_endpoint" "app.au1.sysdig.com"
                                   "secure_api_endpoint"  "app.au1.sysdig.com"
                                   "secure_ui"           "app.au1.sysdig.com/secure")
                       "eu1" (dict "collector_endpoint"  "ingest-eu1.app.sysdig.com"
                                   "monitor_api_endpoint" "eu1.app.sysdig.com"
                                   "secure_api_endpoint"  "eu1.app.sysdig.com"
                                   "secure_ui"           "eu1.app.sysdig.com/secure")
                       "in1" (dict "collector_endpoint"  "ingest.in1.sysdig.com"
                                   "monitor_api_endpoint" "app.in1.sysdig.com"
                                   "secure_api_endpoint"  "app.in1.sysdig.com"
                                   "secure_ui"           "app.in1.sysdig.com/secure")
                       "me2" (dict "collector_endpoint"  "ingest.me2.sysdig.com"
                                   "monitor_api_endpoint" "app.me2.sysdig.com"
                                   "secure_api_endpoint"  "app.me2.sysdig.com"
                                   "secure_ui"           "app.me2.sysdig.com/secure")
                       "us1" (dict "collector_endpoint"  "collector.sysdigcloud.com"
                                   "monitor_api_endpoint" "app.sysdigcloud.com"
                                   "secure_api_endpoint"  "secure.sysdig.com"
                                   "secure_ui"           "secure.sysdig.com")
                       "us2" (dict "collector_endpoint"  "ingest-us2.app.sysdig.com"
                                   "monitor_api_endpoint" "us2.app.sysdig.com"
                                   "secure_api_endpoint"  "us2.app.sysdig.com"
                                   "secure_ui"           "us2.app.sysdig.com/secure")
                       "us3" (dict "collector_endpoint"  "ingest.us3.sysdig.com"
                                   "monitor_api_endpoint" "app.us3.sysdig.com"
                                   "secure_api_endpoint"  "app.us3.sysdig.com"
                                   "secure_ui"           "app.us3.sysdig.com/secure")
                       "us4" (dict "collector_endpoint"  "ingest.us4.sysdig.com"
                                   "monitor_api_endpoint" "app.us4.sysdig.com"
                                   "secure_api_endpoint"  "app.us4.sysdig.com"
                                   "secure_ui"           "app.us4.sysdig.com/secure")
                      "au-syd-monitor"   (dict "collector_endpoint"  "ingest.au-syd.monitoring.cloud.ibm.com"
                                               "monitor_api_endpoint" "au-syd.monitoring.cloud.ibm.com"
                                               "secure_api_endpoint"  "au-syd.security-compliance-secure.cloud.ibm.com"
                                               "secure_ui"           "au-syd.security-compliance-secure.cloud.ibm.com")
                      "br-sao-monitor"   (dict "collector_endpoint"  "ingest.br-sao.monitoring.cloud.ibm.com"
                                               "monitor_api_endpoint" "br-sao.monitoring.cloud.ibm.com"
                                               "secure_api_endpoint"  "br-sao.security-compliance-secure.cloud.ibm.com"
                                               "secure_ui"           "br-sao.security-compliance-secure.cloud.ibm.com")
                      "ca-tor-monitor"   (dict "collector_endpoint"  "ingest.ca-tor.monitoring.cloud.ibm.com"
                                               "monitor_api_endpoint" "ca-tor.monitoring.cloud.ibm.com"
                                               "secure_api_endpoint"  "ca-tor.security-compliance-secure.cloud.ibm.com"
                                               "secure_ui"           "ca-tor.security-compliance-secure.cloud.ibm.com")
                      "eu-de-monitor"    (dict "collector_endpoint"  "ingest.eu-de.monitoring.cloud.ibm.com"
                                               "monitor_api_endpoint" "eu-de.monitoring.cloud.ibm.com"
                                               "secure_api_endpoint"  "eu-de.security-compliance-secure.cloud.ibm.com"
                                               "secure_ui"           "eu-de.security-compliance-secure.cloud.ibm.com")
                      "eu-gb-monitor"    (dict "collector_endpoint"  "ingest.eu-gb.monitoring.cloud.ibm.com"
                                               "monitor_api_endpoint" "eu-gb.monitoring.cloud.ibm.com"
                                               "secure_api_endpoint"  "eu-gb.security-compliance-secure.cloud.ibm.com"
                                               "secure_ui"           "eu-gb.security-compliance-secure.cloud.ibm.com")
                      "jp-osa-monitor"   (dict "collector_endpoint"  "ingest.jp-osa.monitoring.cloud.ibm.com"
                                               "monitor_api_endpoint" "jp-osa.monitoring.cloud.ibm.com"
                                               "secure_api_endpoint"  "jp-osa.security-compliance-secure.cloud.ibm.com"
                                               "secure_ui"           "jp-osa.security-compliance-secure.cloud.ibm.com")
                      "jp-tok-monitor"   (dict "collector_endpoint"  "ingest.jp-tok.monitoring.cloud.ibm.com"
                                               "monitor_api_endpoint" "jp-tok.monitoring.cloud.ibm.com"
                                               "secure_api_endpoint"  "jp-tok.security-compliance-secure.cloud.ibm.com"
                                               "secure_ui"           "jp-tok.security-compliance-secure.cloud.ibm.com")
                      "us-east-monitor"  (dict "collector_endpoint"  "ingest.us-east.monitoring.cloud.ibm.com"
                                               "monitor_api_endpoint" "us-east.monitoring.cloud.ibm.com"
                                               "secure_api_endpoint"  "us-east.security-compliance-secure.cloud.ibm.com"
                                               "secure_ui"           "us-east.security-compliance-secure.cloud.ibm.com")
                      "us-south-monitor" (dict "collector_endpoint"  "ingest.us-south.monitoring.cloud.ibm.com"
                                               "monitor_api_endpoint" "us-south.monitoring.cloud.ibm.com"
                                               "secure_api_endpoint"  "us-south.security-compliance-secure.cloud.ibm.com"
                                               "secure_ui"           "us-south.security-compliance-secure.cloud.ibm.com")
                      "au-syd-private-monitor"   (dict "collector_endpoint"  "ingest.private.au-syd.monitoring.cloud.ibm.com"
                                                       "monitor_api_endpoint" "private.au-syd.monitoring.cloud.ibm.com"
                                                       "secure_api_endpoint"  "private.au-syd.security-compliance-secure.cloud.ibm.com"
                                                       "secure_ui"           "private.au-syd.security-compliance-secure.cloud.ibm.com")
                      "br-sao-private-monitor"   (dict "collector_endpoint"  "ingest.private.br-sao.monitoring.cloud.ibm.com"
                                                       "monitor_api_endpoint" "private.br-sao.monitoring.cloud.ibm.com"
                                                       "secure_api_endpoint"  "private.br-sao.security-compliance-secure.cloud.ibm.com"
                                                       "secure_ui"           "private.br-sao.security-compliance-secure.cloud.ibm.com")
                      "ca-tor-private-monitor"   (dict "collector_endpoint"  "ingest.private.ca-tor.monitoring.cloud.ibm.com"
                                                       "monitor_api_endpoint" "private.ca-tor.monitoring.cloud.ibm.com"
                                                       "secure_api_endpoint"  "private.ca-tor.security-compliance-secure.cloud.ibm.com"
                                                       "secure_ui"           "private.ca-tor.security-compliance-secure.cloud.ibm.com")
                      "eu-de-private-monitor"    (dict "collector_endpoint"  "ingest.private.eu-de.monitoring.cloud.ibm.com"
                                                       "monitor_api_endpoint" "private.eu-de.monitoring.cloud.ibm.com"
                                                       "secure_api_endpoint"  "private.eu-de.security-compliance-secure.cloud.ibm.com"
                                                       "secure_ui"           "private.eu-de.security-compliance-secure.cloud.ibm.com")
                      "eu-gb-private-monitor"    (dict "collector_endpoint"  "ingest.private.eu-gb.monitoring.cloud.ibm.com"
                                                       "monitor_api_endpoint" "private.eu-gb.monitoring.cloud.ibm.com"
                                                       "secure_api_endpoint"  "private.eu-gb.security-compliance-secure.cloud.ibm.com"
                                                       "secure_ui"           "private.eu-gb.security-compliance-secure.cloud.ibm.com")
                      "jp-osa-private-monitor"   (dict "collector_endpoint"  "ingest.private.jp-osa.monitoring.cloud.ibm.com"
                                                       "monitor_api_endpoint" "private.jp-osa.monitoring.cloud.ibm.com"
                                                       "secure_api_endpoint"  "private.jp-osa.security-compliance-secure.cloud.ibm.com"
                                                       "secure_ui"           "private.jp-osa.security-compliance-secure.cloud.ibm.com")
                      "jp-tok-private-monitor"   (dict "collector_endpoint"  "ingest.private.jp-tok.monitoring.cloud.ibm.com"
                                                       "monitor_api_endpoint" "private.jp-tok.monitoring.cloud.ibm.com"
                                                       "secure_api_endpoint"  "private.jp-tok.security-compliance-secure.cloud.ibm.com"
                                                       "secure_ui"           "private.jp-tok.security-compliance-secure.cloud.ibm.com")
                      "us-east-private-monitor"  (dict "collector_endpoint"  "ingest.private.us-east.monitoring.cloud.ibm.com"
                                                       "monitor_api_endpoint" "private.us-east.monitoring.cloud.ibm.com"
                                                       "secure_api_endpoint"  "private.us-east.security-compliance-secure.cloud.ibm.com"
                                                       "secure_ui"           "private.us-east.security-compliance-secure.cloud.ibm.com")
                      "us-south-private-monitor" (dict "collector_endpoint"  "ingest.private.us-south.monitoring.cloud.ibm.com"
                                                       "monitor_api_endpoint" "private.us-south.monitoring.cloud.ibm.com"
                                                       "secure_api_endpoint"  "private.us-south.security-compliance-secure.cloud.ibm.com"
                                                       "secure_ui"           "private.us-south.security-compliance-secure.cloud.ibm.com")
                      "au-syd-secure"   (dict "collector_endpoint"  "ingest.au-syd.security-compliance-secure.cloud.ibm.com"
                                              "monitor_api_endpoint" "au-syd.monitoring.cloud.ibm.com"
                                              "secure_api_endpoint"  "au-syd.security-compliance-secure.cloud.ibm.com"
                                              "secure_ui"           "au-syd.security-compliance-secure.cloud.ibm.com")
                      "br-sao-secure"   (dict "collector_endpoint"  "ingest.br-sao.security-compliance-secure.cloud.ibm.com"
                                              "monitor_api_endpoint" "br-sao.monitoring.cloud.ibm.com"
                                              "secure_api_endpoint"  "br-sao.security-compliance-secure.cloud.ibm.com"
                                              "secure_ui"           "br-sao.security-compliance-secure.cloud.ibm.com")
                      "ca-tor-secure"   (dict "collector_endpoint"  "ingest.ca-tor.security-compliance-secure.cloud.ibm.com"
                                              "monitor_api_endpoint" "ca-tor.monitoring.cloud.ibm.com"
                                              "secure_api_endpoint"  "ca-tor.security-compliance-secure.cloud.ibm.com"
                                              "secure_ui"           "ca-tor.security-compliance-secure.cloud.ibm.com")
                      "eu-de-secure"    (dict "collector_endpoint"  "ingest.eu-de.security-compliance-secure.cloud.ibm.com"
                                              "monitor_api_endpoint" "eu-de.monitoring.cloud.ibm.com"
                                              "secure_api_endpoint"  "eu-de.security-compliance-secure.cloud.ibm.com"
                                              "secure_ui"           "eu-de.security-compliance-secure.cloud.ibm.com")
                      "eu-gb-secure"    (dict "collector_endpoint"  "ingest.eu-gb.security-compliance-secure.cloud.ibm.com"
                                              "monitor_api_endpoint" "eu-gb.monitoring.cloud.ibm.com"
                                              "secure_api_endpoint"  "eu-gb.security-compliance-secure.cloud.ibm.com"
                                              "secure_ui"           "eu-gb.security-compliance-secure.cloud.ibm.com")
                      "jp-osa-secure"   (dict "collector_endpoint"  "ingest.jp-osa.security-compliance-secure.cloud.ibm.com"
                                              "monitor_api_endpoint" "jp-osa.monitoring.cloud.ibm.com"
                                              "secure_api_endpoint"  "jp-osa.security-compliance-secure.cloud.ibm.com"
                                              "secure_ui"           "jp-osa.security-compliance-secure.cloud.ibm.com")
                      "jp-tok-secure"   (dict "collector_endpoint"  "ingest.jp-tok.security-compliance-secure.cloud.ibm.com"
                                              "monitor_api_endpoint" "jp-tok.monitoring.cloud.ibm.com"
                                              "secure_api_endpoint"  "jp-tok.security-compliance-secure.cloud.ibm.com"
                                              "secure_ui"           "jp-tok.security-compliance-secure.cloud.ibm.com")
                      "us-east-secure"  (dict "collector_endpoint"  "ingest.us-east.security-compliance-secure.cloud.ibm.com"
                                              "monitor_api_endpoint" "us-east.monitoring.cloud.ibm.com"
                                              "secure_api_endpoint"  "us-east.security-compliance-secure.cloud.ibm.com"
                                              "secure_ui"           "us-east.security-compliance-secure.cloud.ibm.com")
                      "us-south-secure" (dict "collector_endpoint"  "ingest.us-south.security-compliance-secure.cloud.ibm.com"
                                              "monitor_api_endpoint" "us-south.monitoring.cloud.ibm.com"
                                              "secure_api_endpoint"  "us-south.security-compliance-secure.cloud.ibm.com"
                                              "secure_ui"           "us-south.security-compliance-secure.cloud.ibm.com")
                      "au-syd-private-secure"   (dict "collector_endpoint"  "ingest.private.au-syd.security-compliance-secure.cloud.ibm.com"
                                                      "monitor_api_endpoint" "private.au-syd.monitoring.cloud.ibm.com"
                                                      "secure_api_endpoint"  "private.au-syd.security-compliance-secure.cloud.ibm.com"
                                                      "secure_ui"           "private.au-syd.security-compliance-secure.cloud.ibm.com")
                      "br-sao-private-secure"   (dict "collector_endpoint"  "ingest.private.br-sao.security-compliance-secure.cloud.ibm.com"
                                                      "monitor_api_endpoint" "private.br-sao.monitoring.cloud.ibm.com"
                                                      "secure_api_endpoint"  "private.br-sao.security-compliance-secure.cloud.ibm.com"
                                                      "secure_ui"           "private.br-sao.security-compliance-secure.cloud.ibm.com")
                      "ca-tor-private-secure"   (dict "collector_endpoint"  "ingest.private.ca-tor.security-compliance-secure.cloud.ibm.com"
                                                      "monitor_api_endpoint" "private.ca-tor.monitoring.cloud.ibm.com"
                                                      "secure_api_endpoint"  "private.ca-tor.security-compliance-secure.cloud.ibm.com"
                                                      "secure_ui"           "private.ca-tor.security-compliance-secure.cloud.ibm.com")
                      "eu-de-private-secure"    (dict "collector_endpoint"  "ingest.private.eu-de.security-compliance-secure.cloud.ibm.com"
                                                      "monitor_api_endpoint" "private.eu-de.monitoring.cloud.ibm.com"
                                                      "secure_api_endpoint"  "private.eu-de.security-compliance-secure.cloud.ibm.com"
                                                      "secure_ui"           "private.eu-de.security-compliance-secure.cloud.ibm.com")
                      "eu-gb-private-secure"    (dict "collector_endpoint"  "ingest.private.eu-gb.security-compliance-secure.cloud.ibm.com"
                                                      "monitor_api_endpoint" "private.eu-gb.monitoring.cloud.ibm.com"
                                                      "secure_api_endpoint"  "private.eu-gb.security-compliance-secure.cloud.ibm.com"
                                                      "secure_ui"           "private.eu-gb.security-compliance-secure.cloud.ibm.com")
                      "jp-osa-private-secure"   (dict "collector_endpoint"  "ingest.private.jp-osa.security-compliance-secure.cloud.ibm.com"
                                                      "monitor_api_endpoint" "private.jp-osa.monitoring.cloud.ibm.com"
                                                      "secure_api_endpoint"  "private.jp-osa.security-compliance-secure.cloud.ibm.com"
                                                      "secure_ui"           "private.jp-osa.security-compliance-secure.cloud.ibm.com")
                      "jp-tok-private-secure"   (dict "collector_endpoint"  "ingest.private.jp-tok.security-compliance-secure.cloud.ibm.com"
                                                      "monitor_api_endpoint" "private.jp-tok.monitoring.cloud.ibm.com"
                                                      "secure_api_endpoint"  "private.jp-tok.security-compliance-secure.cloud.ibm.com"
                                                      "secure_ui"           "private.jp-tok.security-compliance-secure.cloud.ibm.com")
                      "us-east-private-secure"  (dict "collector_endpoint"  "ingest.private.us-east.security-compliance-secure.cloud.ibm.com"
                                                      "monitor_api_endpoint" "private.us-east.monitoring.cloud.ibm.com"
                                                      "secure_api_endpoint"  "private.us-east.security-compliance-secure.cloud.ibm.com"
                                                      "secure_ui"           "private.us-east.security-compliance-secure.cloud.ibm.com")
                      "us-south-private-secure" (dict "collector_endpoint"  "ingest.private.us-south.security-compliance-secure.cloud.ibm.com"
                                                      "monitor_api_endpoint" "private.us-south.monitoring.cloud.ibm.com"
                                                      "secure_api_endpoint"  "private.us-south.security-compliance-secure.cloud.ibm.com"
                                                      "secure_ui"           "private.us-south.security-compliance-secure.cloud.ibm.com") }}
  {{- toYaml $regions }}
{{- end }}

{{- define "common.collector_endpoint" }}
  {{- $regions := fromYaml (include "common.regions" .) }}
  {{- if not .Values.sysdig_endpoint.collector.host }}
    {{- get (get $regions .Values.sysdig_endpoint.region) "collector_endpoint" }}
  {{- else }}
    {{- .Values.sysdig_endpoint.collector.host }}
  {{- end }}
{{- end }}

{{- define "common.monitor_api_endpoint" }}
  {{- $regions := fromYaml (include "common.regions" .) }}
  {{- if not .Values.sysdig_endpoint.api_url }}
    {{- get (get $regions .Values.sysdig_endpoint.region) "monitor_api_endpoint" }}
  {{- else }}
    {{- .Values.sysdig_endpoint.api_url }}
  {{- end }}
{{- end }}

{{- define "common.secure_api_endpoint" }}
  {{- $regions := fromYaml (include "common.regions" .) }}
  {{- if not .Values.sysdig_endpoint.api_url }}
    {{- get (get $regions .Values.sysdig_endpoint.region) "secure_api_endpoint" }}
  {{- else }}
    {{- .Values.sysdig_endpoint.api_url }}
  {{- end }}
{{- end }}

{{- define "common.secure_ui" }}
  {{- $regions := fromYaml (include "common.regions" .) }}
  {{- if not .Values.sysdig_endpoint.api_url }}
    {{- get (get $regions .Values.sysdig_endpoint.region) "secure_ui" }}
  {{- else }}
    {{- .Values.sysdig_endpoint.api_url }}
  {{- end }}
{{- end }}
