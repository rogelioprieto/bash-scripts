#!/bin/bash
#author: Rogelio Prieto Alvarado
#7/february/2021
#Objective: generate TWO screenshot of each page of a pdf file,
# in a reduce size (height 800px and png8 format)


#How to execute:
#Parametes: pdf-filename
#./generate-screenshots-from-pdf.sh filename.pdf
#Note. Screenshots are saved in the OUTPUTFOLDER path, the screenshots subfolder.


#Requirements (packages):
#1. poppler-utils (sudo apt-get install poppler-utils)
#2. imagemagick (sudo apt install imagemagick)

#Known errors:
#1. Syntax Error (199275): Dictionary key must be a name object"
#this erros appears to occurs for the pdf format file. You can ignore it!

echo "ℹ️   Procesando el archivo: $1"
#Step 1. Extract screenshots from pdf file.
pdftocairo -png $1

#Step 2. count the png screenshots files
FILES=*.png
OUTPUTFOLDER=screenshots
#echo "FILES:"$FILES
COUNTFILES=$(ls *.png | wc -l)

#Step 3. create a subfolder to move and save the screenshots
if [ $COUNTFILES -eq 0 ]
then
    echo "No se generaron screenshots."
else
    echo "📄  Procesando $COUNTFILES screenshots..."
    mkdir -p $OUTPUTFOLDER
    #get filename without extension
	filename=$(basename -- "$1")
    filename="${filename%.*}"
    mv $filename-*.png $OUTPUTFOLDER
    cd $OUTPUTFOLDER
    
fi

#Step 3. Move,resize and compress png screenshots
WIDTH=800
WIDTHSMALL=560


for file in $FILES
do

    name=${file%.*}
    extension=${file#*.}

    #option 1. using RGB sRGB source: https://imagemagick.org/script/formats.php

    convert $file  -bordercolor DarkGray  -border 2  -colorspace RGB   -resize ${WIDTH}x\>  -colorspace sRGB -colors 255 PNG8:$file
    
    convert $file -bordercolor DarkGray  -border 2 -colorspace RGB     -resize ${WIDTHSMALL}x\> -colorspace sRGB -colors 255  PNG8:${name}-small.${extension}
    

    #option 2. without RGB sRGB
    #convert $file  -bordercolor DarkGray  -border 2     -resize ${WIDTH}x\>   -colors 255 PNG8:$file
    
    #convert $file -bordercolor DarkGray  -border 2     -resize ${WIDTHSMALL}x\>  -colors 255  PNG8:${name}-small.${extension}
    
    #example:
    #convert image.png -resize 800x\>  PNG8:image.png
done
echo -e "👍 ¡listo!\n\nLas imágenes están almacenadas en el subdirectorio:\n📂 screenshots\n"

#Sources:
#https://graphicdesign.stackexchange.com/questions/120255/how-does-tinypng-com-minimize-pictures
#https://legacy.imagemagick.org/Usage/resize/#resize
