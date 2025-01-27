#!/usr/bin/env bash

set -euo pipefail

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
