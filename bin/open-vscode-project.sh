#!/bin/bash

# WORKSPACE_LIST="$(plocate -d ~/Documents/files.index code-workspace | grep -Ev '\.cache|\.local|node_module|History|Template' | sed "s|$HOME/||g" | sort)"
# SELECTED="$(echo "$WORKSPACE_LIST" | wofi -d -sep ' ' -i -G -p 'vscode project')"

SELECTED=$(wofi -d -sep ' ' -i -G -p 'vscode project' <$XDG_CACHE_HOME/vscode-project-list)

[[ -z "$SELECTED" ]] && exit 1

JAVA_HOME=$SDKMAN_CANDIDATES_DIR/java/current \
OPENSSL_CONF=$XDG_CONFIG_HOME/openssl.cnf \
code \
  --new-window \
  --enable-proposed-api GitHub.copilot \
  --proxy-server="socks5://127.0.0.1:1080" \
  "$HOME/$SELECTED"
