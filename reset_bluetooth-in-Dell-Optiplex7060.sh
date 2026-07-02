#!/bin/bash
# Wait for the MATE desktop environment to finish booting
sleep 3

# Safely stop the bluetooth service wrapper
sudo systemctl stop bluetooth

# Force reset the specific btusb driver handling the Barrot chip
sudo rmmod btusb
sleep 1
sudo modprobe btusb

# Restart the bluetooth background service
sudo systemctl start bluetooth

# Bring the hardware state back online 
sudo hciconfig hci0 up
