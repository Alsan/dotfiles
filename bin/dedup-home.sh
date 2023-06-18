#!/bin/sh

echo 'dedup files...'
czkawka_cli dup \
  -d $HOME \
  -e $GOMODCACHE \
  -e $SDKMAN_CANDIDATES_DIR \
  -e $XDG_CACHE_HOME \
  -e $HOME/Documents/1.work/5.complatform/3.backend/3.dockerized/data \
  -e $HOME/Documents/1.work/3.ydt/.npm-cache \
  -e $HOME/.local/share/containers/storage/overlay \
  -e $HOME/Documents/6.docker \
  -l \
  -D HARD

