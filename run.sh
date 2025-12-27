#!/bin/sh
set -e

# If user provided a custom config in HA's /config, use it
if [ -f /config/mediamtx.yaml ]; then
  echo "[mediamtx-addon] Using /config/mediamtx.yml"
  cp /config/mediamtx.yaml /mediamtx.yml
else
  echo "[mediamtx-addon] No /config/mediamtx.yaml, using image default /mediamtx.yml"
fi

exec mediamtx /mediamtx.yml
