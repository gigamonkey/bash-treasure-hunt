#!/usr/bin/env bash

set -euo pipefail

mkdir -p haystack2

for f in haystack2/{a..g}{a..g}.txt; do
    printf "hay\n%s\n" "$1" > "$f"
done

printf "needle\n%s\n" "$1" > "$(random_file_in haystack2)"

echo "Your next secret is the last line of the only file in haystack2 that contains 'needle'."
