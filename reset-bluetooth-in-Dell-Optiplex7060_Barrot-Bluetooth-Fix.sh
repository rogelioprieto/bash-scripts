#!/bin/bash
# Fix for Barrot Bluetooth chip on Dell Optiplex 7060

# 1. Unload the USB transport and the Barrot/Realtek specific drivers
modprobe -r btusb
modprobe -r btrtl

# 2. Reload the drivers back into the kernel
modprobe btrtl
modprobe btusb

# 3. Give the kernel time to handshake with the Barrot hardware
sleep 3

# 4. Clear automatic soft blocks triggered by the reload
rfkill unblock bluetooth

# 5. Bring the interface up explicitly
hciconfig hci0 up
