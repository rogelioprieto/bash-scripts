#!/bin/bash
#author: Rogelio Prieto Alvarado
#22/march/2022
#Objective: calculate the bpm for each mp3 in this directory or any subdirectories. Tag each file (mp3 tag).

#initialize counter variable
counter_file=0
#process each .mp3 file
while read -r line ; do
	echo "=============="
    #incrementar el contador de archivos.
    counter_file=$(($counter_file+1))
	#show filename
    echo $counter_file.file:\"$line\"

    #add quotes at begin and end
    #line=$(echo \"$line\")
    #echo "line=$line"
    bpm-tag $line
    #echo \"$line\" | echo

done <<< "$(find . -name '*.mp3'   -type f  -follow -print)"
#explanation about this subshell: https://stackoverflow.com/questions/16854280/a-variable-modified-inside-a-while-loop-is-not-remembered
echo "=============="
echo "=============="
echo $counter_file"  .mp3 files were analyzed."




