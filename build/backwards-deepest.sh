#!/usr/bin/env bash
# The hint is backwards in the deepest file of a set of directories.

set -euo pipefail

destination='deepest/gp/a'
mkdir -p ./deepest/{a..g}{a..p}

for f in deepest/{a..g}{a..p}/{a..f}.txt; do
    touch "$f"
    printf "%s\n" "$(fake_id "$1")" > "$f"
done

secret=$(echo "$1" | rev)
chars="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
random_index=$((SRANDOM % ${#chars}))
random_chars=${chars:$random_index:2}

rm -rf "$destination.txt"
mkdir "$destination"
echo "$secret" > "$destination/$random_chars.txt"

echo "The hint is in the deepest file in $PUZZLE/deepest, and reversed"