#!/bin/bash
#inicializar las variables que se utilizarán para generar el archivo reporte.txt
counter_file=0
tempfilename=$(date +%m-%d-%Y-%H%M%S)

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
echo $counter_file" archivos .mp3 fueron analizados."




