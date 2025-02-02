#!/usr/bin/env bash

set -euo pipefail

# Secret is the last line of the biggest file in puzzle/sizes

file=$(
    # Find files and print them with their size and name, NUL terminated
    find puzzle/sizes -type f -printf '%s/%p\0' | \
        sort -znr | \
        head -zn 1 | \
        cut -zd '/' -f 2- | \
        tr -d '\0' \
    )

tail -1 "$file"
