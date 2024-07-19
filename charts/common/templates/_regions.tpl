{{- define "sysdig.regions" -}}
  {{- $regions := dict "au1" (dict "collectorEndpoint"  "ingest.au1.sysdig.com"
                                   "monitorApiEndpoint" "app.au1.sysdig.com"
                                   "secureApiEndpoint"  "app.au1.sysdig.com"
                                   "secureUi"           "app.au1.sysdig.com/secure")
                       "eu1" (dict "collectorEndpoint"  "ingest-eu1.app.sysdig.com"
                                   "monitorApiEndpoint" "eu1.app.sysdig.com"
                                   "secureApiEndpoint"  "eu1.app.sysdig.com"
                                   "secureUi"           "eu1.app.sysdig.com/secure")
                       "in1" (dict "collectorEndpoint"  "ingest.in1.sysdig.com"
                                   "monitorApiEndpoint" "app.in1.sysdig.com"
                                   "secureApiEndpoint"  "app.in1.sysdig.com"
                                   "secureUi"           "app.in1.sysdig.com/secure")
                       "me2" (dict "collectorEndpoint"  "ingest.me2.sysdig.com"
                                   "monitorApiEndpoint" "app.me2.sysdig.com"
                                   "secureApiEndpoint"  "app.me2.sysdig.com"
                                   "secureUi"           "app.me2.sysdig.com/secure")
                       "us1" (dict "collectorEndpoint"  "collector.sysdigcloud.com"
                                   "monitorApiEndpoint" "app.sysdigcloud.com"
                                   "secureApiEndpoint"  "secure.sysdig.com"
                                   "secureUi"           "secure.sysdig.com")
                       "us2" (dict "collectorEndpoint"  "ingest-us2.app.sysdig.com"
                                   "monitorApiEndpoint" "us2.app.sysdig.com"
                                   "secureApiEndpoint"  "us2.app.sysdig.com"
                                   "secureUi"           "us2.app.sysdig.com/secure")
                       "us3" (dict "collectorEndpoint"  "ingest.us3.sysdig.com"
                                   "monitorApiEndpoint" "app.us3.sysdig.com"
                                   "secureApiEndpoint"  "app.us3.sysdig.com"
                                   "secureUi"           "app.us3.sysdig.com/secure")
                       "us4" (dict "collectorEndpoint"  "ingest.us4.sysdig.com"
                                   "monitorApiEndpoint" "app.us4.sysdig.com"
                                   "secureApiEndpoint"  "app.us4.sysdig.com"
                                   "secureUi"           "app.us4.sysdig.com/secure")
                      "au-syd-monitor"   (dict "collectorEndpoint"  "ingest.au-syd.monitoring.cloud.ibm.com"
                                               "monitorApiEndpoint" "au-syd.monitoring.cloud.ibm.com"
                                               "secureApiEndpoint"  "au-syd.security-compliance-secure.cloud.ibm.com"
                                               "secureUi"           "au-syd.security-compliance-secure.cloud.ibm.com")
                      "br-sao-monitor"   (dict "collectorEndpoint"  "ingest.br-sao.monitoring.cloud.ibm.com"
                                               "monitorApiEndpoint" "br-sao.monitoring.cloud.ibm.com"
                                               "secureApiEndpoint"  "br-sao.security-compliance-secure.cloud.ibm.com"
                                               "secureUi"           "br-sao.security-compliance-secure.cloud.ibm.com")
                      "ca-tor-monitor"   (dict "collectorEndpoint"  "ingest.ca-tor.monitoring.cloud.ibm.com"
                                               "monitorApiEndpoint" "ca-tor.monitoring.cloud.ibm.com"
                                               "secureApiEndpoint"  "ca-tor.security-compliance-secure.cloud.ibm.com"
                                               "secureUi"           "ca-tor.security-compliance-secure.cloud.ibm.com")
                      "eu-de-monitor"    (dict "collectorEndpoint"  "ingest.eu-de.monitoring.cloud.ibm.com"
                                               "monitorApiEndpoint" "eu-de.monitoring.cloud.ibm.com"
                                               "secureApiEndpoint"  "eu-de.security-compliance-secure.cloud.ibm.com"
                                               "secureUi"           "eu-de.security-compliance-secure.cloud.ibm.com")
                      "eu-gb-monitor"    (dict "collectorEndpoint"  "ingest.eu-gb.monitoring.cloud.ibm.com"
                                               "monitorApiEndpoint" "eu-gb.monitoring.cloud.ibm.com"
                                               "secureApiEndpoint"  "eu-gb.security-compliance-secure.cloud.ibm.com"
                                               "secureUi"           "eu-gb.security-compliance-secure.cloud.ibm.com")
                      "jp-osa-monitor"   (dict "collectorEndpoint"  "ingest.jp-osa.monitoring.cloud.ibm.com"
                                               "monitorApiEndpoint" "jp-osa.monitoring.cloud.ibm.com"
                                               "secureApiEndpoint"  "jp-osa.security-compliance-secure.cloud.ibm.com"
                                               "secureUi"           "jp-osa.security-compliance-secure.cloud.ibm.com")
                      "jp-tok-monitor"   (dict "collectorEndpoint"  "ingest.jp-tok.monitoring.cloud.ibm.com"
                                               "monitorApiEndpoint" "jp-tok.monitoring.cloud.ibm.com"
                                               "secureApiEndpoint"  "jp-tok.security-compliance-secure.cloud.ibm.com"
                                               "secureUi"           "jp-tok.security-compliance-secure.cloud.ibm.com")
                      "us-east-monitor"  (dict "collectorEndpoint"  "ingest.us-east.monitoring.cloud.ibm.com"
                                               "monitorApiEndpoint" "us-east.monitoring.cloud.ibm.com"
                                               "secureApiEndpoint"  "us-east.security-compliance-secure.cloud.ibm.com"
                                               "secureUi"           "us-east.security-compliance-secure.cloud.ibm.com")
                      "us-south-monitor" (dict "collectorEndpoint"  "ingest.us-south.monitoring.cloud.ibm.com"
                                               "monitorApiEndpoint" "us-south.monitoring.cloud.ibm.com"
                                               "secureApiEndpoint"  "us-south.security-compliance-secure.cloud.ibm.com"
                                               "secureUi"           "us-south.security-compliance-secure.cloud.ibm.com")
                      "au-syd-private-monitor"   (dict "collectorEndpoint"  "ingest.private.au-syd.monitoring.cloud.ibm.com"
                                                       "monitorApiEndpoint" "private.au-syd.monitoring.cloud.ibm.com"
                                                       "secureApiEndpoint"  "private.au-syd.security-compliance-secure.cloud.ibm.com"
                                                       "secureUi"           "private.au-syd.security-compliance-secure.cloud.ibm.com")
                      "br-sao-private-monitor"   (dict "collectorEndpoint"  "ingest.private.br-sao.monitoring.cloud.ibm.com"
                                                       "monitorApiEndpoint" "private.br-sao.monitoring.cloud.ibm.com"
                                                       "secureApiEndpoint"  "private.br-sao.security-compliance-secure.cloud.ibm.com"
                                                       "secureUi"           "private.br-sao.security-compliance-secure.cloud.ibm.com")
                      "ca-tor-private-monitor"   (dict "collectorEndpoint"  "ingest.private.ca-tor.monitoring.cloud.ibm.com"
                                                       "monitorApiEndpoint" "private.ca-tor.monitoring.cloud.ibm.com"
                                                       "secureApiEndpoint"  "private.ca-tor.security-compliance-secure.cloud.ibm.com"
                                                       "secureUi"           "private.ca-tor.security-compliance-secure.cloud.ibm.com")
                      "eu-de-private-monitor"    (dict "collectorEndpoint"  "ingest.private.eu-de.monitoring.cloud.ibm.com"
                                                       "monitorApiEndpoint" "private.eu-de.monitoring.cloud.ibm.com"
                                                       "secureApiEndpoint"  "private.eu-de.security-compliance-secure.cloud.ibm.com"
                                                       "secureUi"           "private.eu-de.security-compliance-secure.cloud.ibm.com")
                      "eu-gb-private-monitor"    (dict "collectorEndpoint"  "ingest.private.eu-gb.monitoring.cloud.ibm.com"
                                                       "monitorApiEndpoint" "private.eu-gb.monitoring.cloud.ibm.com"
                                                       "secureApiEndpoint"  "private.eu-gb.security-compliance-secure.cloud.ibm.com"
                                                       "secureUi"           "private.eu-gb.security-compliance-secure.cloud.ibm.com")
                      "jp-osa-private-monitor"   (dict "collectorEndpoint"  "ingest.private.jp-osa.monitoring.cloud.ibm.com"
                                                       "monitorApiEndpoint" "private.jp-osa.monitoring.cloud.ibm.com"
                                                       "secureApiEndpoint"  "private.jp-osa.security-compliance-secure.cloud.ibm.com"
                                                       "secureUi"           "private.jp-osa.security-compliance-secure.cloud.ibm.com")
                      "jp-tok-private-monitor"   (dict "collectorEndpoint"  "ingest.private.jp-tok.monitoring.cloud.ibm.com"
                                                       "monitorApiEndpoint" "private.jp-tok.monitoring.cloud.ibm.com"
                                                       "secureApiEndpoint"  "private.jp-tok.security-compliance-secure.cloud.ibm.com"
                                                       "secureUi"           "private.jp-tok.security-compliance-secure.cloud.ibm.com")
                      "us-east-private-monitor"  (dict "collectorEndpoint"  "ingest.private.us-east.monitoring.cloud.ibm.com"
                                                       "monitorApiEndpoint" "private.us-east.monitoring.cloud.ibm.com"
                                                       "secureApiEndpoint"  "private.us-east.security-compliance-secure.cloud.ibm.com"
                                                       "secureUi"           "private.us-east.security-compliance-secure.cloud.ibm.com")
                      "us-south-private-monitor" (dict "collectorEndpoint"  "ingest.private.us-south.monitoring.cloud.ibm.com"
                                                       "monitorApiEndpoint" "private.us-south.monitoring.cloud.ibm.com"
                                                       "secureApiEndpoint"  "private.us-south.security-compliance-secure.cloud.ibm.com"
                                                       "secureUi"           "private.us-south.security-compliance-secure.cloud.ibm.com")
                      "au-syd-secure"   (dict "collectorEndpoint"  "ingest.au-syd.security-compliance-secure.cloud.ibm.com"
                                              "monitorApiEndpoint" "au-syd.monitoring.cloud.ibm.com"
                                              "secureApiEndpoint"  "au-syd.security-compliance-secure.cloud.ibm.com"
                                              "secureUi"           "au-syd.security-compliance-secure.cloud.ibm.com")
                      "br-sao-secure"   (dict "collectorEndpoint"  "ingest.br-sao.security-compliance-secure.cloud.ibm.com"
                                              "monitorApiEndpoint" "br-sao.monitoring.cloud.ibm.com"
                                              "secureApiEndpoint"  "br-sao.security-compliance-secure.cloud.ibm.com"
                                              "secureUi"           "br-sao.security-compliance-secure.cloud.ibm.com")
                      "ca-tor-secure"   (dict "collectorEndpoint"  "ingest.ca-tor.security-compliance-secure.cloud.ibm.com"
                                              "monitorApiEndpoint" "ca-tor.monitoring.cloud.ibm.com"
                                              "secureApiEndpoint"  "ca-tor.security-compliance-secure.cloud.ibm.com"
                                              "secureUi"           "ca-tor.security-compliance-secure.cloud.ibm.com")
                      "eu-de-secure"    (dict "collectorEndpoint"  "ingest.eu-de.security-compliance-secure.cloud.ibm.com"
                                              "monitorApiEndpoint" "eu-de.monitoring.cloud.ibm.com"
                                              "secureApiEndpoint"  "eu-de.security-compliance-secure.cloud.ibm.com"
                                              "secureUi"           "eu-de.security-compliance-secure.cloud.ibm.com")
                      "eu-gb-secure"    (dict "collectorEndpoint"  "ingest.eu-gb.security-compliance-secure.cloud.ibm.com"
                                              "monitorApiEndpoint" "eu-gb.monitoring.cloud.ibm.com"
                                              "secureApiEndpoint"  "eu-gb.security-compliance-secure.cloud.ibm.com"
                                              "secureUi"           "eu-gb.security-compliance-secure.cloud.ibm.com")
                      "jp-osa-secure"   (dict "collectorEndpoint"  "ingest.jp-osa.security-compliance-secure.cloud.ibm.com"
                                              "monitorApiEndpoint" "jp-osa.monitoring.cloud.ibm.com"
                                              "secureApiEndpoint"  "jp-osa.security-compliance-secure.cloud.ibm.com"
                                              "secureUi"           "jp-osa.security-compliance-secure.cloud.ibm.com")
                      "jp-tok-secure"   (dict "collectorEndpoint"  "ingest.jp-tok.security-compliance-secure.cloud.ibm.com"
                                              "monitorApiEndpoint" "jp-tok.monitoring.cloud.ibm.com"
                                              "secureApiEndpoint"  "jp-tok.security-compliance-secure.cloud.ibm.com"
                                              "secureUi"           "jp-tok.security-compliance-secure.cloud.ibm.com")
                      "us-east-secure"  (dict "collectorEndpoint"  "ingest.us-east.security-compliance-secure.cloud.ibm.com"
                                              "monitorApiEndpoint" "us-east.monitoring.cloud.ibm.com"
                                              "secureApiEndpoint"  "us-east.security-compliance-secure.cloud.ibm.com"
                                              "secureUi"           "us-east.security-compliance-secure.cloud.ibm.com")
                      "us-south-secure" (dict "collectorEndpoint"  "ingest.us-south.security-compliance-secure.cloud.ibm.com"
                                              "monitorApiEndpoint" "us-south.monitoring.cloud.ibm.com"
                                              "secureApiEndpoint"  "us-south.security-compliance-secure.cloud.ibm.com"
                                              "secureUi"           "us-south.security-compliance-secure.cloud.ibm.com")
                      "au-syd-private-secure"   (dict "collectorEndpoint"  "ingest.private.au-syd.security-compliance-secure.cloud.ibm.com"
                                                      "monitorApiEndpoint" "private.au-syd.monitoring.cloud.ibm.com"
                                                      "secureApiEndpoint"  "private.au-syd.security-compliance-secure.cloud.ibm.com"
                                                      "secureUi"           "private.au-syd.security-compliance-secure.cloud.ibm.com")
                      "br-sao-private-secure"   (dict "collectorEndpoint"  "ingest.private.br-sao.security-compliance-secure.cloud.ibm.com"
                                                      "monitorApiEndpoint" "private.br-sao.monitoring.cloud.ibm.com"
                                                      "secureApiEndpoint"  "private.br-sao.security-compliance-secure.cloud.ibm.com"
                                                      "secureUi"           "private.br-sao.security-compliance-secure.cloud.ibm.com")
                      "ca-tor-private-secure"   (dict "collectorEndpoint"  "ingest.private.ca-tor.security-compliance-secure.cloud.ibm.com"
                                                      "monitorApiEndpoint" "private.ca-tor.monitoring.cloud.ibm.com"
                                                      "secureApiEndpoint"  "private.ca-tor.security-compliance-secure.cloud.ibm.com"
                                                      "secureUi"           "private.ca-tor.security-compliance-secure.cloud.ibm.com")
                      "eu-de-private-secure"    (dict "collectorEndpoint"  "ingest.private.eu-de.security-compliance-secure.cloud.ibm.com"
                                                      "monitorApiEndpoint" "private.eu-de.monitoring.cloud.ibm.com"
                                                      "secureApiEndpoint"  "private.eu-de.security-compliance-secure.cloud.ibm.com"
                                                      "secureUi"           "private.eu-de.security-compliance-secure.cloud.ibm.com")
                      "eu-gb-private-secure"    (dict "collectorEndpoint"  "ingest.private.eu-gb.security-compliance-secure.cloud.ibm.com"
                                                      "monitorApiEndpoint" "private.eu-gb.monitoring.cloud.ibm.com"
                                                      "secureApiEndpoint"  "private.eu-gb.security-compliance-secure.cloud.ibm.com"
                                                      "secureUi"           "private.eu-gb.security-compliance-secure.cloud.ibm.com")
                      "jp-osa-private-secure"   (dict "collectorEndpoint"  "ingest.private.jp-osa.security-compliance-secure.cloud.ibm.com"
                                                      "monitorApiEndpoint" "private.jp-osa.monitoring.cloud.ibm.com"
                                                      "secureApiEndpoint"  "private.jp-osa.security-compliance-secure.cloud.ibm.com"
                                                      "secureUi"           "private.jp-osa.security-compliance-secure.cloud.ibm.com")
                      "jp-tok-private-secure"   (dict "collectorEndpoint"  "ingest.private.jp-tok.security-compliance-secure.cloud.ibm.com"
                                                      "monitorApiEndpoint" "private.jp-tok.monitoring.cloud.ibm.com"
                                                      "secureApiEndpoint"  "private.jp-tok.security-compliance-secure.cloud.ibm.com"
                                                      "secureUi"           "private.jp-tok.security-compliance-secure.cloud.ibm.com")
                      "us-east-private-secure"  (dict "collectorEndpoint"  "ingest.private.us-east.security-compliance-secure.cloud.ibm.com"
                                                      "monitorApiEndpoint" "private.us-east.monitoring.cloud.ibm.com"
                                                      "secureApiEndpoint"  "private.us-east.security-compliance-secure.cloud.ibm.com"
                                                      "secureUi"           "private.us-east.security-compliance-secure.cloud.ibm.com")
                      "us-south-private-secure" (dict "collectorEndpoint"  "ingest.private.us-south.security-compliance-secure.cloud.ibm.com"
                                                      "monitorApiEndpoint" "private.us-south.monitoring.cloud.ibm.com"
                                                      "secureApiEndpoint"  "private.us-south.security-compliance-secure.cloud.ibm.com"
                                                      "secureUi"           "private.us-south.security-compliance-secure.cloud.ibm.com") }}

  {{- toYaml $regions }}
{{- end }}

{{- define "sysdig.collectorEndpoint" }}
  {{- $regions := fromYaml (include "sysdig.regions" .) }}
  {{- if hasKey $regions .Values.global.sysdig.region }}
    {{- get (get $regions .Values.global.sysdig.region) "collectorEndpoint"  }}
  {{- end }}
{{- end }}

{{- define "sysdig.monitorApiEndpoint" }}
  {{- $regions := fromYaml (include "sysdig.regions" .) }}
  {{- if hasKey $regions .Values.global.sysdig.region }}
    {{- get (get $regions .Values.global.sysdig.region) "monitorApiEndpoint" }}
  {{- end }}
{{- end }}

{{- define "sysdig.secureApiEndpoint" }}
  {{- $regions := fromYaml (include "sysdig.regions" .) }}
  {{- if hasKey $regions .Values.global.sysdig.region }}
    {{- get (get $regions .Values.global.sysdig.region) "secureApiEndpoint" }}
  {{- end }}
{{- end }}

{{- define "sysdig.secureUi" }}
  {{- $regions := fromYaml (include "sysdig.regions" .) }}
  {{- if hasKey $regions .Values.global.sysdig.region }}
    {{- get (get $regions .Values.global.sysdig.region) "secureUi" }}
  {{- end }}
{{- end }}
