#!/usr/bin/env bash

set -euo pipefail

echo "$1" | rev > backwards.txt

echo "Secret is contents of $PUZZLE/backwards.txt but backwards."
