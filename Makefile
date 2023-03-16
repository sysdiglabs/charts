deps-docs:
	go install kubepack.dev/chart-doc-gen@latest

docs: deps-docs
	find . -name "doc.yaml" | \
		xargs -L1 dirname | \
		xargs -I% sh -c \
			"chart-doc-gen -c %/Chart.yaml -v %/values.yaml -d %/doc.yaml -t %/README.tpl > %/README.md"

lint:
	find . -name "Chart.lock" -type f -delete
	docker run --rm -e CT_VALIDATE_MAINTAINERS=false -u $(shell id -u) -v $(PWD):/charts quay.io/helmpack/chart-testing:latest sh -c "cd /charts; ct lint --all"

deps-unittest:
# TODO: check the if condition
	if [ ! -f $$(helm plugin list | grep unittest) ]; then \
		helm plugin install https://github.com/helm-unittest/helm-unittest --version=0.3.0; \
	fi

unittest:
	find ./charts -name "Chart.yaml" | \
		xargs -L1 dirname | \
		xargs -I% sh -c \
			"helm dependency build % ; helm unittest --strict %"

test-unit-all: deps-helm test-registry-scanner

test-registry-scanner:
	helm unittest --helm3 ./charts/registry-scanner
