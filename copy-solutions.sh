#!/usr/bin/env bash

set -euo pipefail

i=0

while read -r s; do

    solution=solutions/$s.sh
    clue=$(printf "clue-%03d.sh" "$i")

    if [[ -e "$solution" && (! -e "$clue" || "$solution" -nt "$clue") ]]; then
        cp "$solution" "$clue"
    elif [[ -e "$clue" && (! -e "$solution" || "$clue" -nt "$solution") ]]; then
        cp "$clue" "$solution"
    else
        "Echo not sure which to copy of $solution and $clue"
    fi

    (( i += 1 ))

done < build/STEPS
