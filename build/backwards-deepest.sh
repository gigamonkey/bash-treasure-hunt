#!/usr/bin/env bash

set -euo pipefail

mkdir -p deepest
# touch deepest/{a..z}{a..z}/{a..z}.txt

for f in deepest/{a..z}{a..z}/{a..z}.txt; do
    echo fake_file_clue() > "$f"
    printf "%s\n" "$(fake_id "$1")" >> "$f
done

SECRET=<(rev <(echo "$1"))

echo "$1" > deepest/gg/e/a.txt

echo 'The 
# The hint is backwards in the deepest file of a set of directories.