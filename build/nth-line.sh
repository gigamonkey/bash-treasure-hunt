#!/usr/bin/env bash

set -euo pipefail

# shellcheck source=/dev/null
source "$(dirname "$0")/lines.sh"

LINE=33
FILE=lines.txt

ensure_lines "$FILE" 100

replace_line "$FILE" "$(nth_line "$FILE" "$LINE")" "$1"

random_fake_lines "$FILE" 10 "$1"

echo "Secret is line $LINE of the file $PUZZLE/$FILE"
