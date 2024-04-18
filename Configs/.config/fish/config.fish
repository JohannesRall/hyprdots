set -g fish_greeting

if status is-interactive
    starship init fish | source
end

# List Directory
alias ls="lsd"
alias l="ls -l"
alias la="ls -a"
alias lla="ls -la"
alias lt="ls --tree"


# Handy change dir shortcuts
abbr .. 'cd ..'
abbr ... 'cd ../..'
abbr .3 'cd ../../..'
abbr .4 'cd ../../../..'
abbr .5 'cd ../../../../..'

# Hyprconfig
abbr nvimhypr 'nvim ~/Hyprdots/'
alias cphypr="replace_config_folders"

# move user configs

function replace_config_folders
    set -l config_folders nvim hypr waybar fish kitty

    for folder in $config_folders
        if test -d ~/.config/$folder
            echo "Copying $folder..."
            cp -r ~/Hyprdots/Configs/.config/$folder ~/.config/
            echo "Done."
        else
            echo "Folder $folder not found in ~/.config/"
        end
    end
end

# Always mkdir a path (this doesn't inhibit functionality to make a single dir)
abbr mkdir 'mkdir -p'

# Fixes "Error opening terminal: xterm-kitty" when using the default kitty term to open some programs through ssh
alias ssh='kitten ssh'
