syncthing --no-browser &
waybar &
swaybg -c 000000 &
mako &
dbusbattery.py &
# another value I copied from the chinese man
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=wlroots &
