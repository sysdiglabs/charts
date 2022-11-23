# What's Changed
{{ if .Versions -}}
{{ range .Versions }}
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

{{- if .Versions }}
[Unreleased]: {{ .Info.RepositoryURL }}/compare/{{ $latest := index .Versions 0 }}{{ $latest.Tag.Name }}...HEAD
{{ range .Versions -}}
{{ if .Tag.Previous -}}
[{{ .Tag.Name }}]: {{ $.Info.RepositoryURL }}/compare/{{ .Tag.Previous.Name }}...{{ .Tag.Name }}
{{ end -}}
{{ end -}}
{{ end -}}
{{ end -}}
