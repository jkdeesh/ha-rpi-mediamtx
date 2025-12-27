#!/bin/sh
set -e

# If user provided a custom config in HA's /config, use it
if [ -f /config/mediamtx.yml ]; then
  echo "[mediamtx-addon] Using /config/mediamtx.yml"
  cp /config/mediamtx.yml /mediamtx.yml
else
  echo "[mediamtx-addon] No /config/mediamtx.yml, using image default /mediamtx.yml"
fi

exec mediamtx /mediamtx.yml
