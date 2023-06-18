#!/bin/sh

[[ "$#" -lt 2 ]] && {
  SCRIPT_NAME="$(basename -- $0)"
  echo "usage: $SCRIPT_NAME <image> [<tar name>]"
  echo
  echo "examples:"
  echo "  $SCRIPT_NAME ubuntu:18.04"
  echo "  $SCRIPT_NAME ubuntu:18.04 ubuntu"
  exit -1
}

IMAGE=$1
TARNAME=${2:-exported}

echo "IMAGE=$IMAGE"
echo "TARNAME=$TARNAME"

docker save $IMAGE | xz > $TARNAME.tar.xz

