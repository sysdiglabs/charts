#!/usr/bin/env bash

set -e

# not checking input format, just ensuring there's any
if [[ -z "$@" ]]; then
    >&2 echo "At least a param has to be passed."
    >&2 echo "Example usage:"
    >&2 echo "# cd charts/sysdig; ../../scripts/sysdig/image-version-bump.sh -v AGENT_VERSION=1.2.3 -v HOST_ANALYZER_VERSION=4.5.6"
    exit 1
fi

awk $@ '
BEGIN {
    if (AGENT_VERSION)
        version["sysdig/agent"] = AGENT_VERSION
    if (IMAGE_ANALYZER_VERSION)
        version["sysdig/node-image-analyzer"] = IMAGE_ANALYZER_VERSION
    if (HOST_ANALYZER_VERSION)
        version["sysdig/host-analyzer"] = HOST_ANALYZER_VERSION
    if (BENCHMARK_RUNNER_VERSION)
        version["sysdig/compliance-benchmark-runner"] = BENCHMARK_RUNNER_VERSION

    if (length(version) == 0)
        exit 1
}

{
    if ($1 == "repository:") {
        repository = $NF
        print

        # we assume tag to be right after
        getline

        if (repository in version)
            sub(/:.*/, ": "version[repository])
    }
    print
}
' values.yaml > values.yaml.2
mv values.yaml.2 values.yaml


awk $@ '
BEGIN {
    if (!AGENT_VERSION)
        print
        exit 0
}

{
    if ($1 ~ /^appVersion:/)
        sub(/:.*/, ": "AGENT_VERSION)

    print
}
' Chart.yaml > Chart.yaml.2
mv Chart.yaml.2 Chart.yaml
