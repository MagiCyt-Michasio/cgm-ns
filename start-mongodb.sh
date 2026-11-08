#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"; mkdir -p data/mongodb logs run
command -v mongod >/dev/null 2>&1 || { echo "Brak mongod — najpierw zweryfikuj instalację MongoDB dla Debian ARM64."; exit 1; }
if [ -f run/mongod.pid ] && kill -0 "$(cat run/mongod.pid)" 2>/dev/null; then echo "MongoDB już działa."; exit 0; fi
mongod --dbpath "$PWD/data/mongodb" --bind_ip 127.0.0.1 --port 27017 --fork --logpath "$PWD/logs/mongodb.log" --pidfilepath "$PWD/run/mongod.pid"
echo "MongoDB działa na 127.0.0.1:27017"
