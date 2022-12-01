{{ if .Versions -}}
{{ range .Versions -}}
{{- $chartName := regexReplaceAll "([A-Za-z]*(\\-[A-Za-z]*)?)\\-.*" .Tag.Name "${1}" -}}
{{- $chartversion := regexReplaceAll "(?:[A-Za-z]*(?:\\-[A-Za-z]*)?)\\-(.*)" .Tag.Name "v${1}" -}}
# {{ $chartversion }}
{{ range .CommitGroups -}}
{{- if not (eq "Ignored" .Title ) -}}
### {{ .Title }}
{{ range .Commits -}}
* {{ if .Scope }}**{{ .Scope }}** [{{ end }}[{{.Hash.Short}}]({{ $.Info.RepositoryURL }}/commit/{{ .Hash.Long }})]: {{ .Subject }}
{{ if .Refs -}}{{ range .Refs }} - {{if .Action}}{{ .Action }}{{ end }} [#{{ .Ref }}]({{ $.Info.RepositoryURL  }}/issues/{{ .Ref }}){{ end -}}
{{ end -}}
{{ end -}}
{{ end -}}
{{ end -}}

{{- if .OtherCommits -}}
### Others
{{ range .OtherCommits -}}
* [{{.Hash.Short}}]({{ $.Info.RepositoryURL  }}/commit/{{ .Hash.Long }})
{{ end -}}
{{ end -}}
{{ end -}}
{{ end -}}
