This file documents all Helm Chart notable changes. The release numbering uses [semantic versioning](http://semver.org).<br></br>
It's AUTO-GENERATED vía github actions ci, do not edit manually.

{{ if .Versions -}}
{{ range .Versions }}
<a name="{{ .Tag.Name }}"></a>
## {{ if .Tag.Previous }}[{{ .Tag.Name }}]{{ else }}{{ .Tag.Name }}{{ end }} - {{ datetime "2006-01-02" .Tag.Date }}
{{ range .CommitGroups -}}
{{- if not (eq "Ignored" .Title ) -}}
### {{ .Title }}
{{ range .Commits -}}
- {{ if .Scope }}**{{ .Scope }}** [{{ end }}[{{.Hash.Short}}]({{ $.Info.RepositoryURL  }}/commit/{{ .Hash.Long }})]: {{ .Subject }} {{ if .Author.Email }} by {{ .Author.Email }} {{ end }}
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
