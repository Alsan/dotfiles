#!/bin/sh

[[ "$#" -eq 0 ]] && {
  SCRIPT_NAME="$(basename -- $0)"
  echo "usage: $SCRIPT_NAME [<folder/to/rescrean>]"
  echo ""
  echo "examples:"
  echo "  $SCRIPT_NAME"
  echo "  $SCRIPT_NAME Pictures/ScreenShoot"
  exit -1
}

FOLDER="${1:-Music}"

adb shell "find /sdcard/$FOLDER/ -exec am broadcast \
    -a android.intent.action.MEDIA_SCANNER_SCAN_FILE \
    -d file://{} \\;"
