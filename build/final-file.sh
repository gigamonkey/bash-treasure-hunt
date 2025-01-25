#!/usr/bin/env bash

# Hide final secret in a really dumb way.

set -euo pipefail

echo "$1" > final_file.txt

echo "Next secret is in $PUZZLE/final_file.txt"
