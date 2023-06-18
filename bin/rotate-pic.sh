#!/bin/sh

[[ "$#" -lt 2 || ! -f "$1" ]] && {
  SCRIPT_NAME="$(basename -- $0)"
  echo "usage: $SCRIPT_NAME <image> [<degree>]"
  echo
  echo "examples:"
  echo "  $SCRIPT_NAME test.png"
  echo "  $SCRIPT_NAME test.png -180"
  exit -1
}

TMPFILE=/tmp/rotated-image_temp.$$
PIC="$1"
DEGREE="${2:-90}"

convert "$PIC" -rotate "$DEGREE" "$TEMPFILE"
mv "$TEMPFILE" "$PIC"

