#!/bin/sh

[[ "$#" -ne 1 || ! -f "$1" ]] && {
  SCRIPT_NAME="$(basename -- $0)"
  echo "usage: $SCRIPT_NAME <apk>"
  echo
  echo "examples:"
  echo "  $SCRIPT_NAME test.apk"
  exit -1
}

APK="$1"
data=$(aapt dump badging "$APK")
name=$(sed -n "s/^application-label-zh:'\(.*\)'/\1/p" <<<$data)
[[ ! -z "$name" ]] && { echo "$name"; exit; } || name=$(sed -n "s/^application-label-zh-CN:'\(.*\)'/\1/p" <<<$data)
[[ ! -z "$name" ]] && { echo "$name"; exit; } || name=$(sed -n "s/^application-label:'\(.*\)'/\1/p" <<<$data)

echo "$name"
