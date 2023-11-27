#!/usr/bin/env bash

volume_status() {
    local status='Unavailable'
    local mute=$(pactl get-sink-mute @DEFAULT_SINK@)
    local reg="\s+[0-9]+\s+\/\s+([0-9]+%)\s+\/\s+-?[0-9.]+\sdB"

    if [[ "$mute" == "Mute: yes" ]]; then 
        status="Muted"
    else 
        local vol=$(pactl get-sink-volume @DEFAULT_SINK@)

        if [[ "$vol" =~ $reg ]]; then
            status="${BASH_REMATCH[1]}"
        fi
    fi

    echo "🔊 $status"
}

date_status() {
    local status=$(date +'%Y-%m-%d %I:%M:%S %p')
    echo "⏱ $status"
}

battery_status() {
    local status="$(acpi -b | fgrep -v 'unavailable' | cut -d ':' -f2-)"
    echo "⚡︎$status"
}

brightness_status() {
    local status=$(brightnessctl -m | cut -d, -f4)
    echo "🔦 $status"
}


swaybar_status() {
    local i=0 
    local battery=

    while true; do
        ((i++ % 60 == 0)) && battery=$(battery_status)
        printf "%s | %s | %s \n" \
            "$battery" \
            "$(volume_status)" \
            "$(date_status)"
        sleep 1
    done
}

swaybar_status
