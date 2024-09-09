#!/bin/bash
#Rogelio Prieto
#sept/2024
#source: 
# https://github.com/VSCodium/vscodium/issues/418#issuecomment-766820735
# https://rogelioprieto.github.io/linux-tips/vscode/vscodium/editors/2022/02/16/how-to-install-vscode-extensions-in-vscodium.html

MYFOLDER=/usr/share/codium/resources/app
# make a backup
#TODO DELETE THIS LINE: sudo cp /home/rogelio/Desktop/product.json--BACKUP---ORIGINAL $MYFOLDER/product.json
sudo cp $MYFOLDER/product.json $MYFOLDER/product.json--BACKUP$(date '+%Y-%m-%d_%H:%M:%S')

#make a temporal copy
cp $MYFOLDER/product.json /tmp/.product.json-codium

#ls -l /tmp/.prod*

# edit the extensionGallery in the file
jq -M '.extensionsGallery.serviceUrl |= "https://marketplace.visualstudio.com/_apis/public/gallery" | .extensionsGallery.itemUrl |= "https://marketplace.visualstudio.com/items" | .extensionsGallery.cacheUrl = "https://vscode.blob.core.windows.net/gallery/index"' /tmp/.product.json-codium >  /tmp/product.json-codium-FINAL

sudo cp /tmp/product.json-codium-FINAL $MYFOLDER/product.json

# delete the temporal files
rm /tmp/.product.json-codium
rm /tmp/product.json-codium-FINAL
