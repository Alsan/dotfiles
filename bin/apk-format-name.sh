#!/bin/sh

[[ "$#" -ne 1 || ! -f "$1" ]] && {
  SCRIPT_NAME="$(basename -- $0)"
  echo "usage: $SCRIPT_NAME <apk>"
  echo
  echo "examples:"
  echo "  $SCRIPT_NAME test.apk"
  exit -1
}

apk=$1
echo "$(apk-name.sh $apk)_$apk"
