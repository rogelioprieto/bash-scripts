#!/bin/bash
 #Removes old revisions of snaps
 #CLOSE ALL SNAPS BEFORE RUNNING THIS
 
 #source: https://superuser.com/a/1330590
 # posted in SuperUser, Popey, the ex-Engineering Manager at Canonical,
 # provided a simple script that can clean up old versions of Snaps 
 # and keep the latest one.
 
 set -eu
 LANG=en_US.UTF-8 snap list --all | awk '/disabled/{print $1, $3}' |
     while read snapname revision; do
         snap remove "$snapname" --revision="$revision"
     done
