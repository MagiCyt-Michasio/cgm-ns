#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
if [ ! -f .env ]; then cp .env.example .env; echo "Utworzono .env — sprawdź ustawienia."; fi
mkdir -p logs run
if [ -f run/cgm.pid ] && kill -0 "$(cat run/cgm.pid)" 2>/dev/null; then echo "CGM już działa."; exit 0; fi
nohup npm start >> logs/cgm.log 2>&1 &
echo $! > run/cgm.pid
sleep 2
if kill -0 "$(cat run/cgm.pid)" 2>/dev/null; then echo "CGM uruchomiony: http://127.0.0.1:3058/dane"; else cat logs/cgm.log; exit 1; fi
