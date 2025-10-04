#!/bin/sh
STATE_FILE="/tmp/waybar_power_state"
SHUTDOWN_DELAY=10

status() {
    if [ -f "$STATE_FILE" ]; then
        echo '{"text":"⏳ Cancel","tooltip":"Shutdown in progress (click to cancel)"}'
    else
        echo '{"text":"⏻","tooltip":"Click to shutdown"}'
    fi
}

toggle() {
    if [ -f "$STATE_FILE" ]; then
        systemctl cancel
        rm -f "$STATE_FILE"
    else
        ( sleep "$SHUTDOWN_DELAY" && systemctl poweroff ) &
        echo $! > "$STATE_FILE"
    fi
}

case "$1" in
    status) status ;;
    toggle) toggle ;;
esac
