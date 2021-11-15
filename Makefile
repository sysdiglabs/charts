
docs: deps
	find -name "doc.yaml" | \
		xargs -L1 dirname | \
		xargs -I% sh -c \
			"cd %; chart-doc-gen -v values.yaml -d doc.yaml -t README.tpl > README.md"

deps:
	go install kubepack.dev/chart-doc-gen@latest
