#!/usr/bin/env bash

set -euo pipefail

FILE="LeBronInfo.txt"

# We rely on the structure: each line has exactly one "LeBron."
# The 50th line has "LeBron" immediately followed by the secret.

# Grab the 50th line from the file
line_of_interest=$(sed -n '50p' "$FILE")

# Remove everything up to and including "LeBron" to isolate the secret
secret="${line_of_interest#*LeBron}"

echo "$secret"
