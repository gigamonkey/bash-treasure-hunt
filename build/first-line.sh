#!/usr/bin/env bash

set -euo pipefail

# shellcheck source=/dev/null
source "$(dirname "$0")/lines.sh"

FILE=lines.txt

ensure_lines "$FILE" 100

first=$(first_line "$FILE")

replace_line "$FILE" "$first" "$1"

random_fake_lines "$FILE" 10 "$1"

echo "Secret is the first line of $PUZZLE/$FILE"
