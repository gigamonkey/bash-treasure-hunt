#!/usr/bin/env bash

set -euo pipefail

TAR_FILE=archive.tar.gz
DIR=archive
SECRET_FILE="$DIR/secret"

mkdir archive
echo "$1" > "$SECRET_FILE"

tar czf "$TAR_FILE" "$DIR"
rm -rf "$DIR"

echo "Secret is in $SECRET_FILE but you need to unpack $TAR_FILE to get at it."
