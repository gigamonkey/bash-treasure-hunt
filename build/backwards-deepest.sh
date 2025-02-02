#!/usr/bin/env bash
# The hint is backwards in the deepest file of a set of directories.

set -euo pipefail

destination='deepest/gp/a'
mkdir -p ./deepest/{a..g}{a..p}

for f in deepest/{a..g}{a..p}/{a..f}.txt; do
    printf "%s\n" "$(fake_id "$1")" > "$f"
done

secret=$(echo "$1" | rev)
rm -rf "$destination.txt"
mkdir "$destination"
echo "$secret" > "$destination/$(generate_random_chars 2).txt"

echo "The hint is in the deepest file in $PUZZLE/deepest, and reversed" 