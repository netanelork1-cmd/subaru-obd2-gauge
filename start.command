#!/bin/bash
# Double-click to start the gauge page.
# Serves this folder on http://localhost:8817 (Web Bluetooth needs localhost or HTTPS)
# and opens it in Chrome. Close this window to stop the server.

cd "$(dirname "$0")" || exit 1
PORT=8817
URL="http://localhost:$PORT/index.html"

if lsof -nP -iTCP:$PORT -sTCP:LISTEN >/dev/null 2>&1; then
  if curl -s "$URL" | grep -q "OBD Gauge Cluster"; then
    echo "Server already running — opening Chrome."
    open -a "Google Chrome" "$URL"
    exit 0
  fi
  echo "Port $PORT is taken by another program. Change PORT at the top of this file."
  read -r -p "Press Enter to close."
  exit 1
fi

echo "Serving $(pwd)"
echo "Opening $URL"
echo "Leave this window open while you use the page. Close it to stop."
( sleep 1; open -a "Google Chrome" "$URL" ) &
exec python3 -m http.server $PORT --bind localhost
