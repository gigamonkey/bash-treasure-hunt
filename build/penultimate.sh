#!/usr/bin/env bash

# Hide final secret in a really dumb way.

set -euo pipefail

echo "$1" > penultimate.txt

echo "Secret is in $PUZZLE/penultimate.txt"
