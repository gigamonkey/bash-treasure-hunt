#!/usr/bin/env bash

set -euo pipefail

# Secret is in the deepest file, reversed

rev "$(find puzzle/deepest/ -printf '%d/%p\n' | sort -nr | head -1 | cut -d / -f 2-)"