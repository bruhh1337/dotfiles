# ~/.config/fish/config.fish

# starship init fish | source
set fish_greeting

set -Ux EDITOR nvim
set -Ux SYSTEMD_EDITOR nvim

# block, line, underscore
set fish_cursor_default underscore

set -gx PATH /opt/intellij/bin $PATH
set -gx PATH /home/kaon/.cargo/bin $PATH
set -gx PATH /home/kaon/.local/share/coursier/bin $PATH
set -gx PATH /home/kaon/.local/bin $PATH

set -gx ELECTRON_OZONE_PLATFORM_HINT auto

# zoxide
zoxide init --cmd j fish | source

# alias
abbr --add pacman "sudo pacman"
abbr --add yay paru
abbr --add ls "eza -a"
abbr --add battery "upower -i /org/freedesktop/UPower/devices/battery_BAT0"
abbr --add copy wl-copy
abbr --add find fd
abbr --add cat bat
# abbr --add cd j
abbr --add hx helix
alias vim nvim
abbr --add cat bat
abbr --add grep rg

# func
function fetch
    ~/.config/fastfetch/random_fastfetch.sh
end

function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# disable mode indicator
function fish_mode_prompt
end
