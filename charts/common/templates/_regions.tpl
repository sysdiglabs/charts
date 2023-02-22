{{- define "sysdig.regions" -}}
  {{- $regions := dict "au1" (dict "collectorEndpoint"  "ingest.au1.sysdig.com"
                                   "monitorApiEndpoint" "app.au1.sysdig.com"
                                   "secureApiEndpoint"  "app.au1.sysdig.com"
                                   "secureUi"           "app.au1.sysdig.com/secure")
                       "eu1" (dict "collectorEndpoint"  "ingest-eu1.app.sysdig.com"
                                   "monitorApiEndpoint" "eu1.app.sysdig.com"
                                   "secureApiEndpoint"  "eu1.app.sysdig.com"
                                   "secureUi"           "eu1.app.sysdig.com/secure")
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
                      "au-syd" (dict "collectorEndpoint"    "ingest.au-syd.monitoring.cloud.ibm.com"
                                     "monitorApiEndpoint"   "au-syd.monitoring.cloud.ibm.com"
                                     "secureApiEndpoint"    "au-syd.sysdig-secure.cloud.ibm.com"
                                     "secureUi"             "au-syd.sysdig-secure.cloud.ibm.com")
                      "br-sao" (dict "collectorEndpoint"    "ingest.br-sao.monitoring.cloud.ibm.com"
                                     "monitorApiEndpoint"   "br-sao.monitoring.cloud.ibm.com"
                                     "secureApiEndpoint"    "br-sao.sysdig-secure.cloud.ibm.com"
                                     "secureUi"             "br-sao.sysdig-secure.cloud.ibm.com")
                      "ca-tor" (dict "collectorEndpoint"    "ingest.ca-tor.monitoring.cloud.ibm.com"
                                     "monitorApiEndpoint"   "ca-tor.monitoring.cloud.ibm.com"
                                     "secureApiEndpoint"    "ca-tor.sysdig-secure.cloud.ibm.com"
                                     "secureUi"             "ca-tor.sysdig-secure.cloud.ibm.com")
                      "eu-de" (dict "collectorEndpoint"     "ingest.eu-de.monitoring.cloud.ibm.com"
                                    "monitorApiEndpoint"    "eu-de.monitoring.cloud.ibm.com"
                                    "secureApiEndpoint"     "eu-de.sysdig-secure.cloud.ibm.com"
                                    "secureUi"              "eu-de.sysdig-secure.cloud.ibm.com")
                      "eu-gb" (dict "collectorEndpoint"     "ingest.eu-gb.monitoring.cloud.ibm.com"
                                    "monitorApiEndpoint"    "eu-gb.monitoring.cloud.ibm.com"
                                    "secureApiEndpoint"     "eu-gb.sysdig-secure.cloud.ibm.com"
                                    "secureUi"              "eu-gb.sysdig-secure.cloud.ibm.com")
                      "jp-osa" (dict "collectorEndpoint"    "ingest.jp-osa.monitoring.cloud.ibm.com"
                                     "monitorApiEndpoint"   "jp-osa.monitoring.cloud.ibm.com"
                                     "secureApiEndpoint"    "jp-osa.sysdig-secure.cloud.ibm.com"
                                     "secureUi"             "jp-osa.sysdig-secure.cloud.ibm.com")
                      "jp-tok" (dict "collectorEndpoint"    "ingest.jp-tok.monitoring.cloud.ibm.com"
                                     "monitorApiEndpoint"   "jp-tok.monitoring.cloud.ibm.com"
                                     "secureApiEndpoint"    "jp-tok.sysdig-secure.cloud.ibm.com"
                                     "secureUi"             "jp-tok.sysdig-secure.cloud.ibm.com")
                      "us-east" (dict "collectorEndpoint"   "ingest.us-east.monitoring.cloud.ibm.com"
                                      "monitorApiEndpoint"  "us-east.monitoring.cloud.ibm.com"
                                      "secureApiEndpoint"   "us-east.sysdig-secure.cloud.ibm.com"
                                      "secureUi"            "us-east.sysdig-secure.cloud.ibm.com")
                      "us-south" (dict "collectorEndpoint"  "ingest.us-south.monitoring.cloud.ibm.com"
                                       "monitorApiEndpoint" "us-south.monitoring.cloud.ibm.com"
                                       "secureApiEndpoint"  "us-south.sysdig-secure.cloud.ibm.com"
                                       "secureUi"           "us-south.sysdig-secure.cloud.ibm.com")
                      "au-syd-private" (dict "collectorEndpoint"    "ingest.private.au-syd.monitoring.cloud.ibm.com"
                                             "monitorApiEndpoint"   "private.au-syd.monitoring.cloud.ibm.com"
                                             "secureApiEndpoint"    "private.au-syd.sysdig-secure.cloud.ibm.com"
                                             "secureUi"             "private.au-syd.sysdig-secure.cloud.ibm.com")
                      "br-sao-private" (dict "collectorEndpoint"    "ingest.private.br-sao.monitoring.cloud.ibm.com"
                                             "monitorApiEndpoint"   "private.br-sao.monitoring.cloud.ibm.com"
                                             "secureApiEndpoint"    "private.br-sao.sysdig-secure.cloud.ibm.com"
                                             "secureUi"             "private.br-sao.sysdig-secure.cloud.ibm.com")
                      "ca-tor-private" (dict "collectorEndpoint"    "ingest.private.ca-tor.monitoring.cloud.ibm.com"
                                             "monitorApiEndpoint"   "private.ca-tor.monitoring.cloud.ibm.com"
                                             "secureApiEndpoint"    "private.ca-tor.sysdig-secure.cloud.ibm.com"
                                             "secureUi"             "private.ca-tor.sysdig-secure.cloud.ibm.com")
                      "eu-de-private" (dict "collectorEndpoint"     "ingest.private.eu-de.monitoring.cloud.ibm.com"
                                            "monitorApiEndpoint"    "private.eu-de.monitoring.cloud.ibm.com"
                                            "secureApiEndpoint"     "private.eu-de.sysdig-secure.cloud.ibm.com"
                                            "secureUi"              "private.eu-de.sysdig-secure.cloud.ibm.com")
                      "eu-gb-private" (dict "collectorEndpoint"     "ingest.private.eu-gb.monitoring.cloud.ibm.com"
                                            "monitorApiEndpoint"    "private.eu-gb.monitoring.cloud.ibm.com"
                                            "secureApiEndpoint"     "private.eu-gb.sysdig-secure.cloud.ibm.com"
                                            "secureUi"              "private.eu-gb.sysdig-secure.cloud.ibm.com")
                      "jp-osa-private" (dict "collectorEndpoint"    "ingest.private.jp-osa.monitoring.cloud.ibm.com"
                                             "monitorApiEndpoint"   "private.jp-osa.monitoring.cloud.ibm.com"
                                             "secureApiEndpoint"    "private.jp-osa.sysdig-secure.cloud.ibm.com"
                                             "secureUi"             "private.jp-osa.sysdig-secure.cloud.ibm.com")
                      "jp-tok-private" (dict "collectorEndpoint"    "ingest.private.jp-tok.monitoring.cloud.ibm.com"
                                             "monitorApiEndpoint"   "private.jp-tok.monitoring.cloud.ibm.com"
                                             "secureApiEndpoint"    "private.jp-tok.sysdig-secure.cloud.ibm.com"
                                             "secureUi"             "private.jp-tok.sysdig-secure.cloud.ibm.com")
                      "us-east-private" (dict "collectorEndpoint"   "ingest.private.us-east.monitoring.cloud.ibm.com"
                                              "monitorApiEndpoint"  "private.us-east.monitoring.cloud.ibm.com"
                                              "secureApiEndpoint"   "private.us-east.sysdig-secure.cloud.ibm.com"
                                              "secureUi"            "private.us-east.sysdig-secure.cloud.ibm.com")
                      "us-south-private" (dict "collectorEndpoint"  "ingest.private.us-south.monitoring.cloud.ibm.com"
                                               "monitorApiEndpoint" "private.us-south.monitoring.cloud.ibm.com"
                                               "secureApiEndpoint"  "private.us-south.sysdig-secure.cloud.ibm.com"
                                               "secureUi"           "private.us-south.sysdig-secure.cloud.ibm.com") }}
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
