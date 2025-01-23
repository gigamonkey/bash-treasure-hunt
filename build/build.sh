#!/usr/bin/env bash

#
# Build the scavenger hunt from a set of clue and scripts that hide them.
#

set -euo pipefail
shopt -s lastpipe

dir=$(dirname "$0")

rm -f .check

readarray -t steps < <(tac "$dir/STEPS")

# The final clue
clue="Extract this last secret and you win!"

mkdir -p puzzle
cd puzzle
rm -f .check

for step in "${steps[@]}"; do
    id="$SRANDOM"
    secret=$(printf "%x: %s" "$id" "$clue")
    clue=$("../$dir/$step" "$secret")
    echo "$(shasum <<< "$id" | cut -c -40)" >> .check
    echo "clue: $clue"
done
