deps-docs:
	go install kubepack.dev/chart-doc-gen@latest

docs: deps-docs
	find . -name "doc.yaml" | \
		xargs -L1 dirname | \
		xargs -I% sh -c \
			"cd %; chart-doc-gen -v values.yaml -d doc.yaml -t README.tpl > README.md"

lint:
	find . -name "Chart.lock" -type f -delete
	docker run --rm -e CT_VALIDATE_MAINTAINERS=false -u $(shell id -u) -v $(PWD):/charts quay.io/helmpack/chart-testing:latest sh -c "cd /charts; ct lint --all"

deps-helm:
	helm plugin install https://github.com/quintush/helm-unittest  || true

test-unit-all: deps-helm test-registry-scanner

test-registry-scanner:
	helm unittest --helm3 ./charts/registry-scanner
