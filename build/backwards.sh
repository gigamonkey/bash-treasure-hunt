#!/usr/bin/env bash

set -euo pipefail

echo "$1" | rev > reversed.txt

echo "Secret is the text inside reversed.txt but you guessed it! backwards"
