#!/bin/bash
# Rogelio Prieto Alvarado
# 06/oct/2025
# Objective: 'disable' or enable the 'Line Out+Mixer' option in Auto-Mute Mode in amixer or alsamixer (audio)

#set 'Disabled' or 'Line Out+Speaker' options for Auto-Mute item. The values can be: 'Disabled' 'Speaker Only' 'Line Out+Speaker'
#you can view the option list for each audio item with this command:
#$ amixer
amixer -c 0 sget 'Auto-Mute Mode' | fgrep -q "Item0: 'Line" && _M=Disabled || _M='Line Out+Speaker'; echo $_M; amixer -c 0 sset 'Auto-Mute Mode' "${_M}"

#Sources:
#- https://superuser.com/a/1215471/985096
#- https://superuser.com/a/445761/985096
#- https://tutonics.com/articles/fix-no-sound-turn-off-auto-mute-in-ubuntu-1210/
