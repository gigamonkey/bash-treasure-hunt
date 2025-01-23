#!/usr/bin/env bash

#
# Build the scavenger hunt from a set of clue and scripts that hide them.
#

set -euo pipefail

dir=$(dirname "$0")

step=0

rm -f .check

while true; do
    script=$(printf "$dir/hide-%03d.sh" "$step")
    step=$((step + 1))
    next_clue=$(printf "$dir/clue-%03d.txt" "$step")

    if [[ -e "$next_clue" ]]; then
        clue_text=$(cat "$next_clue")
        secret=$(printf "%x" $SRANDOM)
        hash=$(shasum <<< "$secret" | cut -c -40)
        combined=$(echo "$secret: $clue_text")
        "$script" "$combined"
        echo "$hash" >> .check
    else
        break
    fi
done
