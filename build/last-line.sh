#!/usr/bin/env bash

set -euo pipefail

# shellcheck source=/dev/null
source "$(dirname "$0")/lines.sh"

FILE=lines.txt

ensure_lines "$FILE" 100

replace_line "$FILE" "$(last_line "$FILE")" "$1"

random_fake_lines "$FILE" 10 "$1"

echo "Secret is the last line of the file $PUZZLE/$FILE"
