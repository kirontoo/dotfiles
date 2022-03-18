#!/bin/sh

USER="kirontoo"
TOKEN="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"

notifications=$(echo "user = \"$USER:$TOKEN\"" | curl -sf -K- https://api.github.com/notifications | jq ".[].unread" | grep -c true)

if [ "$notifications" -gt 0 ]; then
    echo "$notifications"
else
    echo ""
fi
