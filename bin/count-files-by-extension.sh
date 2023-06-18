#!/bin/sh

fd -t f | grep -oE '\.(\w+)$' | huniq -c | sort -rn
