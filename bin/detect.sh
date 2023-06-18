#!/bin/sh

#source ~/bin/debug.sh
#DEBUG set -x

#for f in *.jpg *.jpeg *.png *.webp *.avif; do
for f in $(fd -t f -d 1); do
  if [[ -f "$f" ]]; then
    tags="$(nude-detector "$f")"

    echo "$f $tags"
    if [[ ! -z "$tags" ]]; then
      tmsu tag "$f" $tags
    fi
  fi
done
