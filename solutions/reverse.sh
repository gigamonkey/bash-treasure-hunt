#!/usr/bin/env bash

set -euo pipefail

rev "reversetest.txt" | sort | rev | head -1 | cut -d 'a' -f1