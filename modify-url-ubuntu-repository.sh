#!/bin/bash
#Rogelio Prieto
#sept 2024

#how to use this script
#execute the script as normal user and after that your password will be required to execute sed command
#./modify-url-ubuntu-repository.sh

#make a backup
MYREPOSITORYFILE=/etc/apt/sources.list.d/ubuntu.sources
cp $MYREPOSITORYFILE ~/ubuntu.sources--BACKUP$(date '+%Y-%m-%d_%H:%M:%S')
echo "ubuntu.sources file was backup in your home folder"
#replace your current repository url by the new url repository
sudo sed -i -e 's/http:\/\/archive.ubuntu.com\/ubuntu\//mirror:\/\/mirrors.ubuntu.com\/mirrors.txt/' $MYREPOSITORYFILE
#sudo sed -i -e 's/http:\/\/archive/mirror:\/\/mirrors/' -e 's/\/ubuntu\//\/mirrors.txt/' /etc/apt/sources.list.d/ubuntu.sources
echo "$MYREPOSITORYFILE was updated to mirror://mirrors.ubuntu.com/mirrors.txt"


#sources: https://linuxconfig.org/how-to-select-the-fastest-apt-mirror-on-ubuntu-linux
