#!/usr/bin/env bash

set -euo pipefail

cat "$(grep -L 'just hay' puzzle/haystack/*)"
