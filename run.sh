#!/bin/sh
set -e

SRC_CFG="/config/mediamtx.yaml"
DST_CFG="/etc/mediamtx/mediamtx.yml"

if [ -f "$SRC_CFG" ]; then
  echo "[mediamtx-addon] Using $SRC_CFG"
  cp "$SRC_CFG" "$DST_CFG"
else
  echo "[mediamtx-addon] No $SRC_CFG, using built-in defaults"
  # Optional: write a minimal fallback config here
  cat > "$DST_CFG" <<EOF
paths:
  c270:
    runOnInit: >
      /usr/bin/ffmpeg -f v4l2 -input_format mjpeg -video_size 640x480 -framerate 15
                      -i /dev/video0
                      -pix_fmt yuv420p -c:v libx264 -preset ultrafast -tune zerolatency
                      -f rtsp -rtsp_transport tcp rtsp://127.0.0.1:8554/c270
    runOnInitRestart: yes
EOF
fi

echo "[mediamtx-addon] Starting MediaMTX..."
exec /usr/local/bin/mediamtx "$DST_CFG"
