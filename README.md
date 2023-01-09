# Restart SIM7600G-H 4G Module for Jetson
Description: This is a bash file to restart the SIM7600G-H 4G Module when it's disconnected to the Internet.
## Install:
```
git clone https://github.com/acsii-63/restart-4g.git
```
Compile necessary file
```
g++ -o usb-filter usb-filter.cpp
```
## Usage:
```
sudo bash restart-4g.sh
```
