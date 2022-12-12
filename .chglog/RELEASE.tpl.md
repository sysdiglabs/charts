# What's Changed
{{ if .Versions -}}
{{ range .Versions }}
{{ range .CommitGroups -}}
{{- if not (eq "Ignored" .Title ) -}}
### {{ .Title }}
{{ range .Commits -}}
- {{ if .Scope }}**{{ .Scope }}** [{{ end }}[{{.Hash.Short}}]({{ $.Info.RepositoryURL }}/commit/{{ .Hash.Long }})]: {{ .Subject }}
{{- if .Notes -}}
{{ range .Notes }}
    * {{ .Body }}
{{ end }}
{{ end -}}
{{ end -}}
{{ end -}}
{{ end -}}

{{- if .OtherCommits -}}
### Others
{{ range .OtherCommits -}}
- [{{.Hash.Short}}]({{ $.Info.RepositoryURL  }}/commit/{{ .Hash.Long }})
{{ end -}}
{{ end -}}
{{ end -}}

{{- if .Versions }}
{{ range .Versions -}}
{{ if .Tag.Previous -}}
#### Full diff: {{ $.Info.RepositoryURL }}/compare/{{ .Tag.Previous.Name }}...{{ .Tag.Name }}
{{ end -}}
{{ end -}}
{{ end -}}
{{ end -}}
