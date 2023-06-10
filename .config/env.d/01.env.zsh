export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export ZSH_CACHE_DIR="$XDG_CACHE_HOME/zsh"

export LS_COLORS=${LS_COLORS:-'di=34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'}

export EDITOR=helix
export VISUAL=helix
export SYSTEMD_EDITOR=helix
export BROWSER=brave
export TERM=kitty
export TERMINAL=kitty
export VIDEO=mpv
export IMAGE=feh
export COLORTERM=truecolor
export MANPAGER="sh -c 'col -bx | bat -l man -p --paging always'"
export MAIL=geary

#export WLR_DRM_NO_MODIFIERS=1
export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"

# History
export HISTSIZE=1000
export SAVEHIST=50000
export HISTFILE=$HOME/.zhistory

# Session
export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=sway
export XDG_CURRENT_DESKTOP=sway

# GTK
export MOZ_ENABLE_WAYLAND=1             # only start firefox in wayland mode and no other GTK apps
export MOZ_DBUS_REMOTE=1                # fixes firefox is already running, but is not responding
#export GDK_BACKEND=wayland             # this can prevent programs from starting (e.g. chromium and electron apps). therefore, this should be set per app instead of globally.

# clutter
#export CLUTTER_BACKEND=wayland          # this can prevent programs from starting. therefore, this should be set per app instead of globally.


# elementary
export ECORE_EVAS_ENGINE=wayland-egl
export ELM_ENGINE=wayland_egl
#export ELM_DISPLAY=wl
#export ELM_ACCEL=gl

# java
export _JAVA_AWT_WM_NONREPARENTING=1
export NO_AT_BRIDGE=1
export BEMENU_BACKEND=wayland

# sdl
#export SDL_VIDEODRIVER=wayland	         # this can prevent programs from starting old sdl games. therefore, this should be set per app instead of globally.

# Qt
export QT_QPA_PLATFORM=wayland
#export QT_WAYLAND_FORCE_DPI=physical
#export QT_WAYLAND_DISABLE_WINDOWDECORATION=1

# android/java
export ANDROID_PREFS_ROOT="$XDG_CONFIG_HOME/android"
export ANDROID_HOME="/opt/android-sdk"
export ANDROID_SDK_ROOT="$ANDROID_HOME"
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java

# rust
export CARGO_HOME="$XDG_CACHE_HOME/cargo"
export RUSTUP_HOME="$XDG_CACHE_HOME/rustup"
# PATH="$PATH:$CARGO_HOME/bin"

# go
export GOPATH="$XDG_CACHE_HOME/go"
export GOMODCACHE="$GOPATH/pkg/mod"
# PATH="$PATH:$GOPATH/bin"

# sdkman
export SDKMAN_DIR="$XDG_CACHE_HOME/sdkman"

# mcfly
export MCFLY_FUZZY=true
export MCFLY_RESULTS=20
export MCFLY_INTERFACE_VIEW=BOTTOM
export MCFLY_RESULTS_SORT=LAST_RUN

# for $HOME/bin, $HOME/.bin, $HOME/.local/bin
for d in  "$HOME/bin" "$HOME/.bin" "$HOME/.local/bin"; do
  [[ -d "$d" ]] && PATH="$PATH:$d"
done

# for $XDG_DATA_HOME/cargo/bin, $XDG_DATA_HOME/go/bin
for d in "$XDG_CACHE_HOME/cargo" "$XDG_CACHE_HOME/go"; do
  [[ -d "$d" ]] && PATH="$PATH:$d/bin"
done

for d in "$ANDROID_HOME/emulator" "$ANDROID_HOME/cmdline-tools/latest/bin" "$ANDROID_HOME/platform-tools"; do
  [[ -d "$d" ]] && PATH="$PATH:$d"
done

