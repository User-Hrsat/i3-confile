#!/bin/sh
# Toggle touchpad status
# Using libinput and xinput

# Use xinput list and do a search for touchpads. Then get the first one and get its name.
device="$(xinput list | grep -P '(?<= )[\w\s:]*(?i)(touchpad|synaptics)(?-i).*?(?=\s*id)' -o | head -n1)"

# If it was activated disable it and if it wasn't disable it
xinput disable "$device"
