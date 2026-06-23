#!/bin/bash
set -euo pipefail

APP_DIR="/opt/simple-server-panel"
SERVICE_FILE="/etc/systemd/system/simple-server-panel.service"

echo "Installing to $APP_DIR"

sudo mkdir -p "$APP_DIR"
sudo cp -r app scripts requirements.txt .env.example "$APP_DIR/"
sudo cp .env.example "$APP_DIR/.env"

sudo python3 -m venv "$APP_DIR/.venv"
sudo "$APP_DIR/.venv/bin/pip" install --upgrade pip
sudo "$APP_DIR/.venv/bin/pip" install -r "$APP_DIR/requirements.txt"

sudo chmod +x "$APP_DIR/scripts/media_control.sh"

sudo cp simple-server-panel.service "$SERVICE_FILE"

echo
echo "Now configure sudoers:"
echo "  sudo visudo -f /etc/sudoers.d/simple-server-panel"
echo
echo "You can use sudoers.d/simple-server-panel as a template."
echo
echo "Then run:"
echo "  sudo systemctl daemon-reload"
echo "  sudo systemctl enable --now simple-server-panel"
echo
