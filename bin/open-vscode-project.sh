#!/bin/bash

PROJ_LIST=$(cat $XDG_CACHE_HOME/vscode-project-list | sort | uniq -c | sort -nr | awk '{print $2}')
SELECTED=$(wofi -d -sep ' ' -i -G -p 'vscode project' <<<$PROJ_LIST)

[[ -z "$SELECTED" ]] && exit 1

echo "$SELECTED" >> $XDG_CACHE_HOME/vscode-project-list
$HOME/bin/code "$HOME/$SELECTED"
