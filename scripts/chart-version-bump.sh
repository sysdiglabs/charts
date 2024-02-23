#!/usr/bin/env sh

set -e

awk '
{
    if ($0 ~ /^version:/)
    {
        l = split($NF, v, ".");
        v[l]++;
        for (i=1; i<l; ++i)
            V = V v[i] "."
        V = V v[i]
        $NF=V
    }
    print
}' Chart.yaml > Chart.yaml.2

mv Chart.yaml.2 Chart.yaml
