#!/bin/sh

grep -iE 'installed|upgraded' /var/log/pacman.log
