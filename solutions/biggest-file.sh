#!/usr/bin/env bash

set -euo pipefail

tail -1 "$(find puzzle/sizes/ -type f -exec wc -c {} \; | sort -n | tail -1 | perl -pe 's/^[0-9]+ //')"
