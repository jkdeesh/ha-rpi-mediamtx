#!/bin/sh
set -e

SRC_CFG="/config/mediamtx.yaml"    # your file
DST_CFG="/mediamtx.yml"            # what mediamtx expects

if [ -f "$SRC_CFG" ]; then
  echo "[mediamtx-addon] Using $SRC_CFG"
  cp "$SRC_CFG" "$DST_CFG"
else
  echo "[mediamtx-addon] No $SRC_CFG, using image default $DST_CFG"
fi

exec mediamtx "$DST_CFG"
