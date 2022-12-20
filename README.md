# predict-restart
This is a bash file to restart a usb-port (in this situation is the SIM7600G-H 4G Module) with a predetermined period of time
to fix the problem that the module is automatically disconnected after a random amount of time.
Note: run with super-user permission (need to change the file in /sys/)

PREDICT RESTART THE SIM7600G-H MODULE 0.1
Usage: sudo bash predict_restart.sh [-options] {usb_port}

OPTIONS:
  -h: Print this help summary page.
  -t <seconds>: Time between two turns on and off (seconds).
  -v: Print version number.
  
  usb_port: USB port connect with SIM7600G-H 4G Module.
