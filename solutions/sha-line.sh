#!/usr/bin/env bash

set -euo pipefail

target=$(cat puzzle/lines-sha.txt)

while read -r line; do
    sha=$(echo "$line" | sha256sum | cut -c -64)
    if [[ "$sha" = "$target" ]]; then
        echo "$line"
        exit 0
    fi
done < puzzle/lines.txt
