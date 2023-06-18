#!/bin/bash

[ "$UID" !=0 ] && su=sudo

COUNTRY=${1:-CN}
URL="https://archlinux.org/mirrorlist/?country=$COUNTRY&protocol=http&ip_version=4&use_mirror_status=on"
TMPFILE=$(mktemp --suffix=-mirrorlist)

wget -qO- "$URL" | sed 's/^#Server/Server/g' | grep -v '## China' | rankmirrors - > "$TMPFILE"
$su mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
$su mv "$TMPFILE" /etc/pacman.d/mirrorlist
