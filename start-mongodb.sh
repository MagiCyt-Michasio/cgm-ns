#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
ROOT="$(pwd)"
DATA="$ROOT/data/mongodb"
LOG="$ROOT/logs/mongodb.log"
PID="$ROOT/run/mongod.pid"
mkdir -p "$DATA" "$ROOT/logs" "$ROOT/run"
if ! command -v mongod >/dev/null 2>&1; then echo "Nie znaleziono mongod. MongoDB nie jest zainstalowane."; exit 1; fi
if [ -f "$PID" ] && kill -0 "$(cat "$PID")" 2>/dev/null; then echo "MongoDB już działa (PID $(cat "$PID"))."; exit 0; fi
mongod --dbpath "$DATA" --bind_ip 127.0.0.1 --port 27017 --fork --logpath "$LOG" --pidfilepath "$PID"
echo "MongoDB działa lokalnie na 127.0.0.1:27017"
