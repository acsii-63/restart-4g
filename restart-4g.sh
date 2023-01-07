#!/bin/bash

args=("$@")

if [[ ${args[0]} == "" ]]; then
    echo "RESTART when SIM7600G-H is disconnect to the Internet"
    echo "Usage: sudo bash restart-4g.sh {usb_port}"
    echo
    echo "usb_port: USB port connect with SIM7600G-H 4G Module."
else
    while [[ 0 ]]; do
        ping -c 1 google.com &> /dev/null && sudo bash -c "echo $usb_port > /sys/bus/usb/drivers/usb/unbind" || sudo bash -c "echo $usb_port > /sys/bus/usb/drivers/usb/bind"
    done
fi
