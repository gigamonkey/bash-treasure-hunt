#!/usr/bin/env bash

set -euo pipefail

# Secret is in gzipped.gz but it's compressed. You'll need to decompress it.

gzip -cd puzzle/gzipped.gz
