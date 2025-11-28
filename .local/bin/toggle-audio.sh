#!/bin/bash

# Exact names obtained from your system
HEADPHONES="alsa_output.pci-0000_2d_00.4.pro-output-0"
SPEAKERS="alsa_output.pci-0000_2d_00.4.pro-output-1"

# Get current default sink
CURRENT_SINK=$(pactl get-default-sink)

if [ "$CURRENT_SINK" == "$SPEAKERS" ]; then
  # If currently on speakers, switch to headphones
  NEW_SINK="$HEADPHONES"
  DEVICE_NAME="🎧 Headphones (Pro)"
else
  # If currently on headphones (or other), switch to speakers
  NEW_SINK="$SPEAKERS"
  DEVICE_NAME="🔊 Speakers (Pro 1)"
fi

# Set the new default sink
pactl set-default-sink "$NEW_SINK"

# Move currently playing audio streams to the new sink immediately
pactl list short sink-inputs | cut -f1 | xargs -I{} pactl move-sink-input {} "$NEW_SINK"

# Send notification
notify-send -h string:x-canonical-private-synchronous:sys-notify -u low "Audio Output Switched" "$DEVICE_NAME"
