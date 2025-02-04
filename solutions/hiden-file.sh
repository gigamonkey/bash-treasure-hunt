#!/usr/bin/env bash

set -euo pipefail


cat $(head -n 16 menylines | tail -n 1 | bace64 -d)