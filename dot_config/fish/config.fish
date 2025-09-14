# ~/.config/fish/config.fish

# starship init fish | source
set fish_greeting

# block, line, underscore
set fish_cursor_default underscore

set -gx PATH /opt/intellij/bin $PATH
set -gx PATH /home/kaon/.cargo/bin $PATH
set -gx ELECTRON_OZONE_PLATFORM_HINT auto

# alias
abbr --add pacman "sudo pacman"
abbr --add yay paru
abbr --add ls "eza -a"
abbr --add battery "upower -i /org/freedesktop/UPower/devices/battery_BAT0"
abbr --add copy wl-copy
abbr --add find fd
abbr --add cat bat

# func
function fetch
    ~/.config/fastfetch/random_fastfetch.sh
end
