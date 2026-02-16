#!/usr/bin/env bash

set -euo pipefail

FILE=gzipped.gz

echo "$1" | gzip -c > "$FILE"

echo "Secret is in $PUZZLE/$FILE but it's compressed. You'll need to decompress it."
