#!/usr/bin/env bash

while read -r step; do
    if [[ ! -e "$step.sh" ]]; then
        echo "ERROR: no script for $step"
    fi
    if [[ ! -e "$step.txt" ]]; then
        echo "WARNING: no hint for $step"
    fi
done < STEPS
