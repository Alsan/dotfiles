#!/bin/sh

[[ "$#" -ne 1 ]] && {
  SCRIPT_NAME="$(basename -- $0)"
  echo "usage: $SCRIPT_NAME <process name>"
  echo
  echo "examples:"
  echo "  $SCRIPT_NAME wps"
  exit -1
}

PS="$1"

ps aux | grep "$PS" | grep -v grep | awk '{print $2}' | xargs kill -9
