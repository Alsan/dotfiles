#!/bin/bash

###############################
#  Source Commands            #
###############################
function source_if_exists() {
    [[ -f "$1" ]] && source "$1"
}

source_if_exists /etc/profile
source_if_exists /usr/bin/virtualenvwrapper_lazy.sh


###############################
#  Environment Variables      #
###############################
# >>> Filesystem Paths
source <(sed 's/^\(.*\)="/export \1="${\1}:/' /etc/environment)

export MATLABPATH="$HOME/.matlab"
export LIBRARY_PATH="/usr/local/lib:${LIBRARY_PATH}"

if [[ "$(id -u)" = 0 ]]; then
    export PATH="/root/.local/bin:$PATH"
fi

# >>> Miscellaneous
export EDITOR="$(command -v vim)"  # I set this so the crontab would use vim for editing
export QT_QPA_PLATFORMTHEME="qt5ct"  # Fixes: missing okular icons
export RECENTLY_EDITED_FILES_LOG=/home/bryan/Dropbox/var/recently_edited_files.log
export SHELLCHECK_OPTS="-e SC1090 -e SC1091 -e SC1117 -e SC2001 -e SC2016 -e SC2059 -e SC2129 -e SC2155 -e SC2162"
export TERM="rxvt-unicode-256color"  # Fixes Mutt Background Issue (stays transparent) in TMUX
export WORKON_HOME=~/.virtualenvs
export XDG_CONFIG_HOME="$HOME"/.config


###########################
#  Start X Window System  #
###########################
if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]] && [[ "$(id -u)" != 0 ]]; then
    exec startx
else
    # Map Caps Lock to Ctrl
    #
    # WORKS EVEN WHEN WORKING FROM A VIRTUAL CONSOLE!
    map_file=/home/bryan/.Caps2Ctrl.map

    sudo dumpkeys | head -1 > "${map_file}"
    printf "\n%s\n" "keycode 58 = Control" >> "${map_file}"
    sudo loadkeys "${map_file}"
fi
