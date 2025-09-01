#!/bin/bash

function check_conflicts() {
  # check if the only conflict is on the chart version
  CONFLICTS=$(git --no-pager diff --cc --name-only)
  if [[ "$CONFLICTS" = "charts/shield/Chart.yaml" ]]; then
    echo "Chart version conflict detected, accepting the incoming change"

    # Accept the main branch version for Chart.yaml
    git checkout --ours charts/shield/Chart.yaml
    git add charts/shield/Chart.yaml

    echo "Resolved Chart.yaml conflict, continuing rebase"
    export GIT_EDITOR=true
    if git rebase --continue; then
        echo "Rebase continued successfully"
    else
        echo "Checking for conflicts again ..."
        check_conflicts
    fi
  elif [[ "$CONFLICTS" = "" ]]; then
    echo "All conflicts resolved!"
  else
    echo "Unexpected conflicts detected in: $CONFLICTS"
    git rebase --abort
    exit 1
  fi
}

if git pull --rebase origin main; then
    echo "Rebased successfully!"
else
    echo "Rebase conflicts detected"
    check_conflicts
fi

git push -f
