#!/bin/sh

[[ "$#" -ne 1 ]] && {
  SCRIPT_NAME="$(basename -- $0)"
  echo "usage: $SCRIPT_NAME <tar file>"
  echo
  echo "examples:"
  echo "  $SCRIPT_NAME ubuntu.tar.xz"
  exit -1
}

TAR=$1

xz -d -k < $TAR | docker load

