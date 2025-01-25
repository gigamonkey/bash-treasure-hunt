#!/usr/bin/env bash

set -euo pipefail

tail -1 "$(grep -l needle puzzle/haystack2/*)"
