{{ with (first .Versions) -}}
{{ $chartName := regexReplaceAll "([A-Za-z]*(\\-[A-Za-z]*)?)\\-.*" .Tag.Name "${1}" }}
# Chart: {{ $chartName }}

All notable changes to this chart will be documented in this file.

Please note that it's AUTO-GENERATED vía github actions, DO NOT EDIT MANUALLY.

The old manually updated changelog is kept for history and can be viewed [here]({{ $.Info.RepositoryURL }}/blob/master/charts/{{ $chartName }}/old_CHANGELOG.md).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).
{{ end -}}

## Changelog

{{ if .Versions -}}
{{ range .Versions }}
<a name="{{ .Tag.Name }}"></a>
## {{ if .Tag.Previous }}[{{ .Tag.Name }}]{{ else }}{{ .Tag.Name }}{{ end }} - {{ datetime "2006-01-02" .Tag.Date }}
{{ range .CommitGroups -}}
{{- if not (eq "Ignored" .Title ) -}}
### {{ .Title }}
{{ range .Commits -}}
- {{ if .Scope }}**{{ .Scope }}** [{{ end }}[{{.Hash.Short}}]({{ $.Info.RepositoryURL }}/commit/{{ .Hash.Long }})]: {{ .Subject }} {{ if .Author.Email }} by {{ .Author.Email }} {{ end }}
{{ if .Refs -}}{{ range .Refs }} - {{if .Action}}{{ .Action }}{{ end }} [#{{ .Ref }}]({{ $.Info.RepositoryURL  }}/issues/{{ .Ref }}){{ end -}}
{{ end -}}
{{ end -}}
{{ end -}}
{{ end -}}

{{- if .OtherCommits -}}
### Others
{{ range .OtherCommits -}}
- [{{.Hash.Short}}]({{ $.Info.RepositoryURL  }}/commit/{{ .Hash.Long }}) {{ if .Author.Email }} by {{ .Author.Email }} {{ end }}
{{ end -}}
{{ end -}}
{{ end -}}
{{ end -}}
