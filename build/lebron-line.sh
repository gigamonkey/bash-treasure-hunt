#!/usr/bin/env bash

set -euo pipefail

# shellcheck source=/dev/null
source "$(dirname "$0")/lebron-line.sh"

LINE=23
FILE=lebron.txt

ensure_lines "$FILE" 100

replace_line "$FILE" "$(nth_line "$FILE" "$LINE")" "$1"

random_fake_lines "$FILE" 10 "$1"

echo "Secret is in the line related to lebron in the file $PUZZLE/$FILE"
