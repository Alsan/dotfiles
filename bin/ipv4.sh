#!/bin/sh

ip -j a show | jq -r '.[].addr_info[] | select(.family=="inet" and .local!="127.0.0.1") | .local'
