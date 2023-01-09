#!/bin/bash

dmesg | grep "Product: SimTech" > detect_device.txt

# g++ -o usb-filter usb-filter.cpp

./usb-filter

usb_port=$(<usb_port.txt)

while [[ 0 ]]; do
    if ping -c 1 google.com &> /dev/null
    then
        echo "connected"
    else
        echo "disconneted -> restarting..."
        sudo bash -c "echo $usb_port > /sys/bus/usb/drivers/usb/unbind"
        sudo bash -c "echo $usb_port > /sys/bus/usb/drivers/usb/bind"
        echo "complete the restart"
    fi
done
