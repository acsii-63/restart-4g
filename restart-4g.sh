#!/bin/bash

args=("$@")
usb_port=${args[0]}

if [[ $usb_port == "" ]]; then
    echo "RESTART when SIM7600G-H is disconnect to the Internet"
    echo "Usage: sudo bash restart-4g.sh {usb_port}"
    echo
    echo "usb_port: USB port connect with SIM7600G-H 4G Module."
else
    while [[ 0 ]]; do
        # ping -c 1 google.com &> /dev/null && echo "connected" || sudo bash -c "echo $usb_port > /sys/bus/usb/drivers/usb/bind"
        if ping -c 1 google.com &> /dev/null
        then
            echo "connected"
        else
            sudo bash -c "echo $usb_port > /sys/bus/usb/drivers/usb/unbind"
            sudo bash -c "echo $usb_port > /sys/bus/usb/drivers/usb/bind"
        fi
    done
fi
