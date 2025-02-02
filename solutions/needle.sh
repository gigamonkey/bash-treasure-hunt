#!/usr/bin/env bash

set -euo pipefail

# Secret is the last line of the only file in puzzle/needle that contains 'needle'.

tail -1 "$(grep -l needle puzzle/needle/*)"
