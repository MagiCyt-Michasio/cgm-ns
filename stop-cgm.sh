#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
if [ -f run/cgm.pid ]; then kill "$(cat run/cgm.pid)" 2>/dev/null || true; rm -f run/cgm.pid; echo "CGM zatrzymany."; else echo "CGM nie ma aktywnego PID."; fi
