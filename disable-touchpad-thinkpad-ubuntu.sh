#!/bin/bash
# disable touchpad
# Rogelio Prieto
# 2021

# source: 
# https://askubuntu.com/questions/751413/how-to-disable-enable-toggle-touchpad-in-a-dell-laptop
# https://gist.github.com/iamkissg/50513b294c65dd20a82a807a85b58f7a
# https://askubuntu.com/questions/751413/how-to-disable-enable-toggle-touchpad-in-a-dell-laptop

#option 01. In one line
#bash -c 'xinput --disable $(xinput --list | grep -i 'trackpoint' | grep -o 'id=[0-9]*' | sed 's/id=//')'

#option 02. In two lines, more legible
bash -c 'xinput --disable \
  $(xinput --list | grep -i 'touchpad' | grep -o 'id=[0-9]*' | sed 's/id=//')'
