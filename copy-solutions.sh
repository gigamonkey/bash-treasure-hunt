#!/usr/bin/env bash

set -euo pipefail

#
# Copy solutions from the solutions directory to the correctly numbered
# clue-xxx.sh script if it is newer than the clue-xxx.sh script. Also copies a
# clue-xxx.sh script to the correctly named solution script if the solution
# script doesn't already exist.
#
# Basically this script is handy for testing while developing puzzle steps.
#


i=0

while read -r s; do

    solution=solutions/$s.sh
    clue=$(printf "clue-%03d.sh" "$i")

    if [[ -e "$solution" && (! -e "$clue" || "$solution" -nt "$clue" || "$(sum "$clue" | cut -d ' ' -f 1)" = "14431") ]]; then
        cp "$solution" "$clue"
    elif [[ -e "$clue" && ! -e "$solution" ]]; then
        cp "$clue" "$solution"
    fi

    (( i += 1 ))

done < build/STEPS
