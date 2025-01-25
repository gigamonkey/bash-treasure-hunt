#!/usr/bin/env bash

set -euo pipefail

cat puzzle/base64.txt | base64 -d
