#!/usr/bin/env bash

set -euo pipefail

# shellcheck source=/dev/null
source "$(dirname "$0")/lines.sh"

FILE=wave.txt

ensure_lines "$FILE" 100

input="$1"
even=""
odd=""
for ((i=0; i<${#input}; i++)); do
  if (( i % 2 == 0 )); then
    even+="${input:i:1} "
  else
    odd+="${input:i:1} "
  fi
done
even=${even% }
odd=${odd% }
wavy="$even
  $odd"

replace_line "$FILE" "$(last_line "$FILE")" "$wavy"

random_fake_lines "$FILE" 10 "$1"

echo "Secret is the last line of the file ${PUZZLE:-puzzle}/$FILE but wavy"