#!/bin/sh
export ELECTRON_OZONE_PLATFORM_HINT=auto

syncthing --no-browser & disown
waybar & disown
swaybg -c 000000 & disown
mako & disown
dbusbattery.py & disown
# another value i copied from the chinese man
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=wlroots & disown

dwl
# exec dwl
