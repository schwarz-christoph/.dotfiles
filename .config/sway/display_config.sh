#!/bin/bash

# Erhalte die Liste der angeschlossenen Ausgänge
outputs=$(swaymsg -t get_outputs | jq -r '.[] | select(.active) | .name')

# Zähle die Anzahl der externen Bildschirme
external_count=0
for output in $outputs; do
    if [[ "$output" != "eDP-1" ]]; then # Annahme: 'eDP-1' ist der interne Bildschirm
        external_count=$((external_count+1))
    fi
done

# Konfiguriere die Bildschirme basierend auf der Anzahl der externen Bildschirme
if [[ $external_count -ge 3 ]]; then
    # Deaktiviere den internen Bildschirm und aktiviere externe Bildschirme
    swaymsg output eDP-1 disable
    for output in $outputs; do
        if [[ "$output" != "eDP-1" ]]; then
            swaymsg output $output enable
        fi
    done
else
    # Aktiviere den internen Bildschirm
    swaymsg output eDP-1 enable
fi

