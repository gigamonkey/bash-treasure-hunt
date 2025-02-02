#!/usr/bin/env bash

set -euo pipefail

# Secret is in the deepest file, reversed

find ./puzzle/deepest -type f | sed -E 's/^.*\/deepest\/..\/.\.txt//' | sort | uniq | tail -n1 | xargs cat | rev