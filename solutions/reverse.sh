#!/usr/bin/env bash

set -euo pipefail

real_clue="$(rev "puzzle/letters.txt" | sort | rev | head -1)"
echo "${real_clue:0:-1}"