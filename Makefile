.PHONY: unittest

deps-docs:
	go install kubepack.dev/chart-doc-gen@v0.4.7

docs: deps-docs
	find . -name "doc.yaml" | \
		xargs -L1 dirname | \
		xargs -I% sh -c \
			"chart-doc-gen -c %/Chart.yaml -v %/values.yaml -d %/doc.yaml -t %/README.tpl > %/README.md"

lint:
	find . -name "Chart.lock" -type f -delete
	docker run --rm -e CT_VALIDATE_MAINTAINERS=false -u $(shell id -u) -v $(PWD):/charts quay.io/helmpack/chart-testing:latest sh -c "cd /charts; ct lint --target-branch=main --all"

deps-unittest:
	@helm plugin install https://github.com/helm-unittest/helm-unittest --version=0.6.1 || true

unittest: deps-unittest
	find ./charts -name "Chart.yaml" | \
		xargs -L1 dirname | \
		xargs -I% sh -c \
			"helm dependency build % ; helm unittest --strict -f "tests/**/*_test.yaml" %"

unit-test-rs: deps-unittest
	find ./charts/registry-scanner -name "Chart.yaml" | \
		xargs -L1 dirname | \
		xargs -I% sh -c \
			"helm dependency build % ; helm unittest --strict %"

deps:
	find ./charts -name "Chart.yaml" | \
		xargs -L1 dirname | \
		xargs -I% sh -c \
			"helm dependency build %"
