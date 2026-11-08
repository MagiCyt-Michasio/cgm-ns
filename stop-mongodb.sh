#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
if [ -f run/mongod.pid ]; then mongod --shutdown --dbpath "$PWD/data/mongodb" || kill "$(cat run/mongod.pid)" 2>/dev/null || true; rm -f run/mongod.pid; echo "MongoDB zatrzymane."; else echo "MongoDB nie ma aktywnego PID."; fi
