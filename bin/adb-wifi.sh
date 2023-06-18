#!/bin/bash
   
#Modify this with your IP range
IPV4=$(ip -j a show | jq -r '.[].addr_info[] | select(.family=="inet" and .local!="127.0.0.1") | .local')
IPV4_RANGE="${IPV4%.*}"

#You usually wouldn't have to modify this
PORT_BASE=5555

#List the devices on the screen for your viewing pleasure
adb devices
echo

#Find USB devices only (no emulators, genymotion or connected devices
declare -a deviceArray=(`adb devices -l | grep -v emulator | grep -v vbox | grep -v "${IP_RANGE}" | grep " device " | awk '{print $1}'`)  

echo "found ${#deviceArray[@]} device(s)"
echo

for index in ${!deviceArray[*]}
do
echo "finding IP address for device ${deviceArray[index]}"
#IP_ADDRESS=$(adb -s ${deviceArray[index]} shell ifconfig wlan0 | awk '{print $3}')
IP_ADDRESS=$(adb -s ${deviceArray[index]} shell "ip addr show wlan0 | grep -e wlan0$ | cut -d\" \" -f 6 | cut -d/ -f 1")


echo "IP address found : $IP_ADDRESS "

echo "Connecting..."
adb -s ${deviceArray[index]} tcpip $(($PORT_BASE + $index))
adb -s ${deviceArray[index]} connect "$IP_ADDRESS:$(($PORT_BASE + $index))"

echo
echo
done

adb devices -l
#exit
