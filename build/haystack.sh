#!/usr/bin/env bash

set -euo pipefail

. $(dirname "$0")/functions.sh

mkdir -p haystack

for f in haystack/{a..g}{a..g}.txt; do
    echo "just hay here" > "$f"
    echo "$(secretish "$(fake_file_clue)")" >> "$f"
done

echo "$1" > "$(ls -1 haystack/* | shuf | head -1)"

echo "Your next secret is the contents of the only file in haystack that does not contain hay."
