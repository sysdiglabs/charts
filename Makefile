
docs: deps
	find -name "doc.yaml" | \
		xargs -L1 dirname | \
		xargs -I% sh -c \
			"cd %; chart-doc-gen -v values.yaml -d doc.yaml -t README.tpl > README.md"

lint:
	docker run --rm -e CT_VALIDATE_MAINTAINERS=false -u $(shell id -u) -v $(PWD):/charts quay.io/helmpack/chart-testing:latest sh -c "cd /charts; ct lint --all"

deps:
	go install kubepack.dev/chart-doc-gen@latest

run-local-admission:
	helm upgrade --install --create-namespace -n sysdig-admission-controller sysdig-admission-controller \
		--set sysdig.url=$(SECURE_URL) \
		--set sysdig.secureAPIToken=$(SECURE_API_TOKEN) \
		--set clusterName="minikube-local" \
		./charts/admission-controller

uninstall-local-admission:
	helm uninstall sysdig-admission-controller -n sysdig-admission-controller
