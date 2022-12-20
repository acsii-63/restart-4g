#!/bin/bash

args=("$@")
version="0.1"
# options
opt=${args[0]}
# time between 2 "turn on-off" momment
time_o=${args[1]}
# usb port connect to SIM7600G-H 4G MODULE
usb_port=${args[2]}


# no argument or help
if [[ $opt == "-h" || $opt == "" ]]; then
    echo "PREDICT RESTART THE SIM7600G-H MODULE 0.1"
    echo "Usage: sudo bash predict_restart.sh [-options] {usb_port}"
    echo
    echo "OPTIONS:"
    echo "  -h: Print this help summary page."
    echo "  -t <seconds>: Time between two turns on and off (seconds)."
    echo "  -v: Print version number."
    echo
    echo "usb_port: USB port connect with SIM7600G-H 4G Module." 
fi

# display the version
if [[ $opt == "-v" ]]; then
    echo "version 0.1"
fi

#
if [[ $opt == "-t" ]]; then
    while [[ 0 ]]; do
        sleep $time_o
        sudo bash -c "echo $usb_port > /sys/bus/usb/drivers/usb/unbind"
        # sleep 1
        sudo bash -c "echo $usb_port > /sys/bus/usb/drivers/usb/bind"
    done
fi