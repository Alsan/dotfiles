#!/bin/bash

for APP in $(adb shell pm list packages -3); do
    APP=$(echo ${APP} | sed "s/^package://")
    adb backup -f ${APP}.backup ${APP}
done
