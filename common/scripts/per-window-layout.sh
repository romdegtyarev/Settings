#!/bin/bash

# Configuration
LAYOUTS="us,ru"
TOGGLE_OPTION="grp:caps_toggle"
LOG_FILE="$HOME/.local/share/per-window-layout.log"

# Ensure log directory exists before writing
mkdir -p "$(dirname "$LOG_FILE")"
echo "=== Script started at $(date) ===" >> "$LOG_FILE"

# Set initial keyboard layout
setxkbmap -layout "$LAYOUTS" -option "$TOGGLE_OPTION"

# Check dependencies
command -v xdotool >/dev/null || { echo "xdotool not found" | tee -a "$LOG_FILE"; exit 1; }
command -v xkblayout-state >/dev/null || { echo "xkblayout-state not found" | tee -a "$LOG_FILE"; exit 1; }

declare -A layout_map
last_win=""

# Convert layout name (us/ru) to layout index (0/1)
get_layout_index() {
    case "$1" in
        us) echo 0 ;;
        ru) echo 1 ;;
        *) echo 0 ;;  # default fallback
    esac
}

while true; do
    win_id=$(xdotool getwindowfocus 2>/dev/null)

    if [[ -n "$win_id" && "$win_id" != "$last_win" ]]; then
        echo "[$(date)] Focus changed: $last_win → $win_id" >> "$LOG_FILE"

        # Save layout for the previously focused window
        if [[ -n "$last_win" ]]; then
            layout=$(xkblayout-state print "%s")
            layout_map["$last_win"]="$layout"
            echo "[$(date)] Saved layout for $last_win: $layout" >> "$LOG_FILE"
        fi

        # Restore layout for the newly focused window
        saved_layout=${layout_map["$win_id"]}
        if [[ -n "$saved_layout" ]]; then
            layout_index=$(get_layout_index "$saved_layout")
            xkblayout-state set "$layout_index"
            echo "[$(date)] Restored layout for $win_id: $saved_layout ($layout_index)" >> "$LOG_FILE"
        else
            echo "[$(date)] No saved layout for $win_id, using current layout" >> "$LOG_FILE"
        fi

        last_win="$win_id"
    fi

    sleep 0.2
done

