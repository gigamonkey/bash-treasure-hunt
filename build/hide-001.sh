#!/usr/bin/env bash

# Hide a secret in a really dumb way.

set -euo pipefail

echo "$1" > second-file.txt
