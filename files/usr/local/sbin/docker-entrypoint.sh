#!/usr/bin/env bash

set -Eeuo pipefail

./vendor/bin/wait-for-it.sh "mongodb:27017" -t 30

exec "$@"
