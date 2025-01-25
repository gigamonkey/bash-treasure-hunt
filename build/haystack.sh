#!/usr/bin/env bash

set -euo pipefail

# shellcheck source=/dev/null
. "$(dirname "$0")/functions.sh"

mkdir -p haystack

for f in haystack/{a..g}{a..g}.txt; do
    echo "just hay here" > "$f"
    printf "%s\n" "$(fake_id "$1")" >> "$f"
done

echo "$1" > "$(random_file_in haystack)"

echo "Your next secret is the contents of the only file in haystack that does not contain hay."
