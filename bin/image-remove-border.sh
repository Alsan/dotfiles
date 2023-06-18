#!/bin/sh

[[ "$#" -lt 2 ]] && {
  SCRIPT_NAME="$(basename -- $0)"
  echo "usage: $SCRIPT_NAME <src> <trg> [<fuzz percentage>]"
  echo ""
  echo "examples:"
  echo "  $SCRIPT_NAME input.png output.png"
  echo "  $SCRIPT_NAME input.png output.png 20"
  echo "  $SCRIPT_NAME input.png png:- | icat"
  exit -1
}

SRC="$1"
TRG="$2"
PERCENTAGE="${3:-70}%"

convert "$SRC" -fuzz "$PERCENTAGE" -trim "$TRG"
