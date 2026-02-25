#!/usr/bin/env bash

set -euo pipefail

echo "$1" | rev > reversed.txt

echo "Secret is contents of $PUZZLE/reversed.txt but backwards."
