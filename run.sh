#!/usr/bin/with-contenv bashio
# Copy user config
mkdir -p /etc/mediamtx
cp /config/mediamtx.yaml /etc/mediamtx/mediamtx.yml

# Add video0 path example (edit mediamtx.yml for source: ffmpeg://input_format=mjpeg /dev/video0)
exec /usr/local/bin/mediamtx /etc/mediamtx/mediamtx.yml
