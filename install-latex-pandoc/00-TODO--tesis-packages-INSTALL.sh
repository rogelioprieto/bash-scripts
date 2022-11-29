#!/bin/bash
echo "INICIO"

tlmgr init-usertree
#TODO DELETE THIS LINE:
tlmgr option repository ftp://tug.org/historic/systems/texlive/2019/tlnet-final
#plist=( "letltxmacro"  "menukeys" "xstring" "pgf)" "adjustbox" "collectbox" "relsize" "catoptions" "stix" )
plist=(letltxmacro  menukeys xstring pgf adjustbox collectbox relsize catoptions stix)

#echo ${plist[@]}


for i in "${plist[@]}"; do echo -e "\n---\nInstalling $i\n----\n";tlmgr --verify-repo=none install "$i"; done

echo "---"
echo "actualizando el mapa de fuentes...(updmap-sys)"
sudo updmap-sys
#for package in "${myplist[*]}"
#do

#	echo "estoy in:"$package
#done
#echo "FIN"
echo "---"


#my_array=(foo bar)
#echo ${my_array[@]}

echo "---"

#for i in "${my_array[@]}"; do echo "$i"; done

echo "---"

#for i in "${my_array[*]}"; do echo "$i"; done








#tlmgr --verify-repo=none install letltxmacro



#letltxmacro
#menukeys
#xstring
#pgf (is for tikz package jeje)
#adjustbox
#collectbox
#relsize
#catoptions
#stix

