#!/bin/sh

[[ "$#" -ne 2 || ! -f "$1" ]] && {
  SCRIPT_NAME="$(basename -- $0)"
  echo "usage: $SCRIPT_NAME <m3u8> [<mp4>]"
  echo
  echo "examples:"
  echo "  $SCRIPT_NAME test.m3u8"
  echo "  $SCRIPT_NAME test.m3u8 test.mp4"
  exit -1
}

INPUT="$1"
OUTPUT=${2:-downloaed_$(date +%F).mp4}

ffmpeg -i "$INPUT" -codec copy "$OUTPUT"
