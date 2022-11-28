#!/bin/bash

set -e

OLDIFS=$IFS
node_analyzer_chart_path="node-analyzer"
agent_chart_path="agent"
kspm_collector_chart_path="kspm-collector"
rapid_response_chart_path="rapid-response"
admission_controller_chart_path="admission-controller"
sysdig_deploy_path="sysdig-deploy"

minor=0
major=0
patch=0

# helper functions to preserve empty lines and avoid unnecessary changes
bump_dep_preserve_blank() {
    yq '( .dependencies[] | select(.name == "'$1'") | .version) = "~'"$2"'"' charts/$3/Chart.yaml | diff -B charts/$3/Chart.yaml - | patch charts/$3/Chart.yaml -
}

bump_main_preserve_blank() {
    local old_val=$(yq '.version' charts/$2/Chart.yaml)
    sed -i "$(yq '.version | line' "charts/$2/Chart.yaml")s/$old_val/$1/" "charts/$2/Chart.yaml"
}

check_update_needed () {

    new_subchart_version=$(yq '.version' charts/$chart/Chart.yaml)
    sysdig_subchart_version=$(yq '.dependencies[] | select(.name == "'$chart'") | .version ' charts/$sysdig_deploy_path/Chart.yaml | sed "s/~//")

    IFS="." read -ra prev_ver <<< "$sysdig_subchart_version"
    IFS="." read -ra next_ver <<< "$new_subchart_version"

    echo "subchart version in ${chart}/Chart.yaml"
    echo $new_subchart_version
    echo $chart "subchart version in sysdig-deploy/Chart.yaml"
    echo $sysdig_subchart_version

    # update the subchart version in sysdig-deploy/Chart.yaml
    bump_dep_preserve_blank $chart $new_subchart_version $sysdig_deploy_path

    for ((idx=0; idx<3; ++idx)); do
        if [ ${next_ver[idx]} -gt ${prev_ver[idx]} ]
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
}

charts=( "$node_analyzer_chart_path" "$agent_chart_path" "$kspm_collector_chart_path" "$rapid_response_chart_path" "$admission_controller_chart_path" )
for chart in ${charts[@]}
do
    check_update_needed $chart
done

current_sysdig_deploy_version=$(yq '.version' charts/$sysdig_deploy_path/Chart.yaml)

echo -e "\nsysdig-deploy version : $current_sysdig_deploy_version"
IFS='.'
read -ra sysdig_deploy_version <<< "$current_sysdig_deploy_version"

new_major=$((${sysdig_deploy_version[0]}))
new_minor=$((${sysdig_deploy_version[1]}))
new_patch=$((${sysdig_deploy_version[2]}))

if [ $major -eq 1 ]
then
    new_major=$(($new_major + 1))
    new_minor=0
    new_patch=0
    echo "major version change needed"
elif [ $minor -eq 1 ]
then
    new_minor=$(($new_minor + 1))
    new_patch=0
    echo "minor version change needed"
elif [ $patch -eq 1 ]
then
    new_patch=$(($new_patch + 1))
    echo "patch version change needed"
else
    echo "No modifications necessary"
    exit 0
fi

IFS=$OLDIFS
final_sysdig_deploy_version=$(echo -n "$new_major.$new_minor.$new_patch")
echo "Final deploy version is to be : $final_sysdig_deploy_version"
bump_main_preserve_blank $final_sysdig_deploy_version $sysdig_deploy_path
