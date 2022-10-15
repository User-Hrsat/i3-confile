#!/bin/bash

# volume control (up/down/mute/unmute/toggle) + notification

# duration in ms
duration=1500

notify () {
    # get volume level
    percent=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | cut -c -2)

    # check if muted, set title
    [[ $(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}') == '是' ]] && title="静音" || title="音量"

    # create fancy bar
    f=$((percent/10))
    e=$((10-f))
    fchars='◼◼◼◼◼◼◼◼◼◼'
    echars='◻◻◻◻◻◻◻◻◻◻'
    bar="${fchars:0:f}${echars:0:e} $percent%"

    notify-send --app-name=VolumeNotification --expire-time="$duration" --urgency=low "$title" "$bar"
}

# redirect stdout of this script to /dev/null
exec > /dev/null

case "$1" in
    up)
        ponymix increase 5%
        ponymix unmute
        ;;
    down)
        ponymix decrease 5%
        ponymix unmute
        ;;
    mute)
        ponymix mute
        ;;
    unmute)
        ponymix unmute
        ;;
    toggle)
        ponymix toggle
        ;;
esac

notify
