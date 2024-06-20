#!/bin/bash

set -e

sysdig_deploy_path="sysdig-deploy"

admission_controller_chart_path="admission-controller"
agent_chart_path="agent"
cluster_scanner_chart_path="cluster-scanner"
cluster_shield_chart_path="cluster-shield"
common_chart_path="common"
kspm_collector_chart_path="kspm-collector"
node_analyzer_chart_path="node-analyzer"
rapid_response_chart_path="rapid-response"

minor=0
major=0
patch=0

# helper functions used to update exclusively the chart version
# at the line identified with yq
# Usage:
# update_dependencies <subchart> <current_subchart_version> <new_subchart_version> <main_chart_path>
update_dependencies() {
    # Translates to something like:
    # sed -i'' 46s/0.3.1/0.3.2/ charts/sysdig-deploy/Chart.yaml
    # sed -i'' instead of sed -i is used only to make it work in OSX
    # https://stackoverflow.com/questions/4247068/sed-command-with-i-option-failing-on-mac-but-works-on-linux/14813278#14813278
    sed -i'' "$(yq '( .dependencies[] | select(.name == "'"$1"'") | .version) | line' "charts/$4/Chart.yaml")s/$2/$3/" "charts/$4/Chart.yaml"
}

# Usage:
# update_main_chart <current_chart_version> <new_chart_version> <main_chart_path>
update_main_chart() {
    sed -i'' "$(yq '.version | line' "charts/$3/Chart.yaml")s/$1/$2/" "charts/$3/Chart.yaml"
}

check_update_needed () {

    new_subchart_version=$(yq '.version' charts/"$chart"/Chart.yaml)
    sysdig_subchart_version=$(yq '.dependencies[] | select(.name == "'"$chart"'") | .version ' charts/$sysdig_deploy_path/Chart.yaml | sed "s/~//")

    IFS="." read -ra prev_ver <<< "$sysdig_subchart_version"
    IFS="." read -ra next_ver <<< "$new_subchart_version"

    echo "subchart version in ${chart}/Chart.yaml"
    echo "$new_subchart_version"
    echo "$chart" "subchart version in sysdig-deploy/Chart.yaml"
    echo "$sysdig_subchart_version"

    for ((idx=0; idx<3; ++idx)); do
        if [ "${next_ver[idx]}" -gt "${prev_ver[idx]}" ]
        then
            if [ $idx -eq 0 ]
            then
                major=1
            elif [ $idx -eq 1 ]
            then
                minor=1
            elif [ $idx -eq 2 ]
            then
                patch=1
            fi
        fi
    done

    # update the subchart version in sysdig-deploy/Chart.yaml
    if [[ $minor -gt 0 || $major -gt 0 || $patch -gt 0  ]]; then
        update_dependencies "$chart" "$sysdig_subchart_version" "$new_subchart_version" "$sysdig_deploy_path"
    fi
}

charts=( "$node_analyzer_chart_path" "$agent_chart_path" "$kspm_collector_chart_path" "$rapid_response_chart_path" "$admission_controller_chart_path" "$common_chart_path" "$cluster_scanner_chart_path" "$cluster_shield_chart_path")
for chart in "${charts[@]}"
do
    check_update_needed "$chart"
done

current_sysdig_deploy_version=$(yq '.version' charts/$sysdig_deploy_path/Chart.yaml)

echo -e "\nsysdig-deploy version : $current_sysdig_deploy_version"
IFS='.' read -ra sysdig_deploy_version <<< "$current_sysdig_deploy_version"

new_major=$((sysdig_deploy_version[0]))
new_minor=$((sysdig_deploy_version[1]))
new_patch=$((sysdig_deploy_version[2]))

if [ $major -eq 1 ]
then
    new_major=$((new_major + 1))
    new_minor=0
    new_patch=0
    echo "major version change needed"
elif [ $minor -eq 1 ]
then
    new_minor=$((new_minor + 1))
    new_patch=0
    echo "minor version change needed"
elif [ $patch -eq 1 ]
then
    new_patch=$((new_patch + 1))
    echo "patch version change needed"
else
    echo "No modifications necessary"
    exit 0
fi

final_sysdig_deploy_version=$(echo -n "$new_major.$new_minor.$new_patch")
echo "Final deploy version is to be : $final_sysdig_deploy_version"
update_main_chart "$current_sysdig_deploy_version" "$final_sysdig_deploy_version" "$sysdig_deploy_path"
