#!/bin/bash


MONITOR_URL="https://test.com/monitoring/test/api"
CURRENT_PID=$(pgrep -xo test)
LOG_FILE="/var/log/monitoring.log"
PID_FILE="/var/tmp/monitor_test.pid"

if [[ -n "$CURRENT_PID" ]]; then
    if [[ -f "$PID_FILE" ]]; then
        LAST_PID=$(cat "$PID_FILE")
        if [[ "$CURRENT_PID" != "$LAST_PID" ]]; then
            echo "$(date '+%Y-%m-%d %H:%M:%S') - Процесс 'test' был перезапущен. Old PID: $LAST_PID, New PID: $CURRENT_PID" >> "$LOG_FILE"
        fi
    fi
    echo "$CURRENT_PID" > "$PID_FILE"

    curl -s -o /dev/null -w "%{http_code}" -m 15 "$MONITOR_URL" | grep -q '^2' || echo "$(date '+%Y-%m-%d %H:%M:%S') - Cервер мониторинга не доступен $MONITOR_URL" >> "$LOG_FILE"

else
    exit 0
fi