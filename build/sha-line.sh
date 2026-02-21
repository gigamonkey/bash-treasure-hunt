#!/usr/bin/env bash

set -euo pipefail

# shellcheck source=/dev/null
source "$(dirname "$0")/lines.sh"

FILE=lines.txt

ensure_lines "$FILE" 100

r=$(random_line "$FILE")

replace_line "$FILE" "$r" "$1"
random_fake_lines "$FILE" 10 "$1"

echo "$1" | sha256sum | cut -c -64 > lines-sha.txt
echo "Secret is the line of the file $PUZZLE/$FILE whose SHA-256 is in $PUZZLE/lines-sha.txt"
