#!/bin/bash

set -e

# Bumps every chart affected by a cluster-shield release.
#
# Usage:
# scripts/cluster-shield/release-bump.sh <cluster-shield-version>
#
# It updates:
#   * charts/cluster-shield/Chart.yaml  version and appVersion -> <cluster-shield-version>
#   * charts/shield/values.yaml         cluster.image.tag      -> <cluster-shield-version>
#   * charts/shield/Chart.yaml          version                -> bumped by the same
#                                                                 semver level as the release
#
# charts/sysdig-deploy/Chart.yaml is updated afterwards by
# scripts/sysdig-deploy/update-sysdig-deploy.sh, which picks up the new
# cluster-shield chart version from the dependency list.

cluster_shield_chart="charts/cluster-shield/Chart.yaml"
shield_chart="charts/shield/Chart.yaml"
shield_values="charts/shield/values.yaml"

release="${1:-}"

if [[ ! "$release" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    >&2 echo "'$release' is not a valid cluster-shield version"
    >&2 echo "Example usage:"
    >&2 echo "# scripts/cluster-shield/release-bump.sh 1.25.2"
    exit 1
fi

# Escapes the characters that are meaningful to a sed basic regular expression,
# so that a version string can be matched literally.
escape_regex() {
    printf '%s' "$1" | sed 's/[.[\*^$\/]/\\&/g'
}

# Replaces exclusively the value of a key, at the line identified with yq, so
# that the comments feeding chart-doc-gen are left untouched.
# Usage:
# set_value <yq_path> <file> <new_value>
set_value() {
    local line current
    line=$(yq "$1 | line" "$2")
    current=$(yq "$1" "$2")

    # an empty current value would collapse the substitution into `s//new/`,
    # which silently reuses the previously applied regex
    if [[ -z "$line" || "$line" == "0" || -z "$current" || "$current" == "null" ]]; then
        >&2 echo "could not locate a value for $1 in $2"
        exit 1
    fi

    # writing to a temporary file instead of using `sed -i` keeps this working
    # on both GNU and BSD sed, which disagree on the in-place suffix argument
    sed "${line}s/$(escape_regex "$current")/$3/" "$2" > "$2.new"
    mv "$2.new" "$2"
}

# Prints the semver level at which <new> is ahead of <old>, or nothing when
# <new> is not a newer version.
# Usage:
# semver_level <old_version> <new_version>
semver_level() {
    local old new
    IFS='.' read -ra old <<< "$1"
    IFS='.' read -ra new <<< "$2"

    for idx in 0 1 2; do
        if [ "${new[idx]}" -gt "${old[idx]}" ]; then
            case $idx in
                0) echo "major" ;;
                1) echo "minor" ;;
                2) echo "patch" ;;
            esac
            return
        elif [ "${new[idx]}" -lt "${old[idx]}" ]; then
            return
        fi
    done
}

# Usage:
# bump_semver <version> <major|minor|patch>
bump_semver() {
    local version
    IFS='.' read -ra version <<< "$1"

    case "$2" in
        major) echo "$((version[0] + 1)).0.0" ;;
        minor) echo "${version[0]}.$((version[1] + 1)).0" ;;
        patch) echo "${version[0]}.${version[1]}.$((version[2] + 1))" ;;
    esac
}

# Refuses to move any chart backwards: a mistyped release would otherwise
# silently downgrade the published charts.
# Usage:
# assert_not_a_downgrade <current_version> <description>
assert_not_a_downgrade() {
    if [ "$release" != "$1" ] && [ -z "$(semver_level "$1" "$release")" ]; then
        >&2 echo "refusing to downgrade $2 from $1 to $release"
        exit 1
    fi
}

cluster_shield_version=$(yq '.version' "$cluster_shield_chart")
shield_image_tag=$(yq '.cluster.image.tag' "$shield_values")

echo "requested cluster-shield release : $release"
echo "cluster-shield chart version     : $cluster_shield_version"
echo "shield cluster.image.tag         : $shield_image_tag"

assert_not_a_downgrade "$cluster_shield_version" "the cluster-shield chart"
assert_not_a_downgrade "$shield_image_tag" "the shield cluster.image.tag"

if [ "$release" == "$cluster_shield_version" ] && [ "$release" == "$shield_image_tag" ]; then
    echo "No modifications necessary"
    exit 0
fi

# the cluster-shield chart tracks the release one to one
if [ "$release" != "$cluster_shield_version" ]; then
    echo "bumping the cluster-shield chart to $release"
    set_value '.version' "$cluster_shield_chart" "$release"
    set_value '.appVersion' "$cluster_shield_chart" "$release"
fi

# the shield chart has its own version line, incremented at the same semver
# level as the release it is shipping
if [ "$release" != "$shield_image_tag" ]; then
    shield_version=$(yq '.version' "$shield_chart")
    new_shield_version=$(bump_semver "$shield_version" "$(semver_level "$shield_image_tag" "$release")")

    echo "bumping the shield cluster.image.tag to $release"
    set_value '.cluster.image.tag' "$shield_values" "$release"

    echo "bumping the shield chart from $shield_version to $new_shield_version"
    set_value '.version' "$shield_chart" "$new_shield_version"
fi
