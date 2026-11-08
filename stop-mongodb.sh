#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
PID="$(pwd)/run/mongod.pid"
if [ -f "$PID" ]; then
  mongod --shutdown --dbpath "$(pwd)/data/mongodb" || kill "$(cat "$PID")" 2>/dev/null || true
  rm -f "$PID"
  echo "MongoDB zatrzymane."
else echo "Brak pliku PID MongoDB."; fi
