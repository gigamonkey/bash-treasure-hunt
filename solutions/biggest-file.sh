#!/usr/bin/env bash

set -euo pipefail

# Secret is the last line of the biggest file in puzzle/sizes

tail -1 $(find puzzle/sizes/ -type f -printf '%s/%p\n' | sort -nr | head -1 | cut -d '/' -f 2-)
