#!/usr/bin/env bash

set -euo pipefail

cat "$(grep -L 'hay' puzzle/haystack/*)"
