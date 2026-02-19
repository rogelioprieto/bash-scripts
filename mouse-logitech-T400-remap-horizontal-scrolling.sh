#/bin/bash
#Rogelio Prieto
#february 2026
#objective: enable the horizontal scrolling in logitech zone touch mouse T400
# this was tested in Ubuntu MATE 24.04 with Xorg (X11) display server.
# get the mouse ID
myID=$(xinput --list | grep T400.*pointer | cut -d= -f2 | cut -f1)
# remap horizontal scrolling buttons
xinput --set-button-map $myID 1 2 3 4 5 8 9 6 7
