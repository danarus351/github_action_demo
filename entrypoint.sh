#!/usr/bin/bash

export DISPLAY=:0.0
export DBUS_SYSTEM_BUS_ADDRESS=unix:path=/host/run/dbus/system_bus_socket

# Rotate screen if env variable is set [normal, inverted, left or right]
if [[ ! -z "$ROTATE_DISPLAY" ]]; then
  (sleep 3 && DISPLAY=:0 xrandr -o $ROTATE_DISPLAY) &
fi

echo "Starting Xvfb"
Xvfb :0 -screen 0 1024x768x16 &

sleep 5

echo "Starting GUI"
# Start the PyQt6 application
startx python gui_app.py
