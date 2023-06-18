#!/bin/sh

PRIMARY=$1
EXTERNAL=$2
DEVICE_PRIMARY=$(xinput --list | grep ELAN | grep -Po '(?<=id=)\w*')
DEVICE_EXTERNAL=$(xinput --list | grep -v Mouse | grep ILITEK | grep -Po '(?<=id=)\w*')


#echo "DEVICE_PRIMARY=$DEVICE_PRIMARY; PRIMARY=$PRIMARY; EXTERNAL=$EXTERNAL"

xinput map-to-output $DEVICE_PRIMARY $PRIMARY
xinput map-to-output $DEVICE_EXTERNAL $EXTERNAL
