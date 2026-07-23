#!/bin/bash

case $1 in
    status)
        status=$(playerctl -p spotify status 2>/dev/null)
        if [ "$status" = "Playing" ]; then
            artist=$(playerctl -p spotify metadata artist 2>/dev/null)
            title=$(playerctl -p spotify metadata title 2>/dev/null)
            printf '{"text": "\uE602 %s - %s"}' "$artist" "$title"
        elif [ "$status" = "Paused" ]; then
            artist=$(playerctl -p spotify metadata artist 2>/dev/null)
            title=$(playerctl -p spotify metadata title 2>/dev/null)
            printf '{"text": " %s - %s"}' "$artist" "$title"
        else
            echo '{"text": ""}'
        fi
        ;;
    toggle)
        playerctl -p spotify play-pause
        ;;
    next)
        playerctl -p spotify next
        ;;
    prev)
        playerctl -p spotify previous
        ;;
esac
