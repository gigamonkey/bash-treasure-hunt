#!/usr/bin/env bash

set -euo pipefail

mkdir -p haystack

for f in haystack/{a..g}{a..g}.txt; do
    echo "just hay here" > "$f"
    printf "%s\n" "$(fake_id "$1")" >> "$f"
done

echo "$1" > "$(random_file_in haystack)"

echo "Secret is in the only file in $PUZZLE/haystack that does not contain 'hay'."
