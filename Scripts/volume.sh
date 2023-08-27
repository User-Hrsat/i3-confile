#!/bin/sh

pactl set-sink-volume @DEFAULT_SINK@ $1 && $refresh_i3status
current_volume=$(pactl list sinks | grep '^[[:space:]]音量：' | head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')
if ((${current_volume}>100)); then
    pactl set-sink-volume @DEFAULT_SINK@ 100% && $refresh_i3status
fi
