#!/bin/bash

#ftypes=$( fd -t f | grep -E ".*\.[a-zA-Z0-9]*$" | sed -e 's/.*\(\.[a-zA-Z0-9]*\)$/\1/' | sort -u)
#
#for ft in $ftypes
#do
#    echo -ne "$ft\t"
#    find . -name "*${ft}" -exec du -bcsh '{}' + | tail -1 | sed 's/\stotal//'
#done


IFS=
while read -r ftype; do
  echo -ne "$ftype\t"
  fd -e $ftype -x du -bcsh '{}'  | tail -1 | sed 's/\stotal//'
done<<<$(fd -t f | grep -E '.*\.[a-zA-Z0-9]*$' | sed -e 's/.*\.\([a-zA-Z0-9]*\)$/\1/' | sort -u)