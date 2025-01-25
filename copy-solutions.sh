#!/usr/bin/env bash

set -euo pipefail
set -x

i=0

while read -r s; do
    cp "solutions/$s.sh" "$(printf "clue-%03d.sh" "$i")"
    (( i += 1 ))
done < build/STEPS
