#/bin/bash

gs -q -dNOPAUSE -dBATCH -dSAFER -sDEVICE=pdfwrite -dCompatibilityLevel=1.3 -dPDFSETTINGS=/ebook -dEmbedAllFonts=true -dSubsetFonts=true -dColorImageDownsampleType=/Bicubic -dColorImageResolution=96 -dGrayImageDownsampleType=/Bicubic -dGrayImageResolution=96 -dMonoImageDownsampleType=/Bicubic -dMonoImageResolution=96 -sOutputFile=out.pdf poster2025-3raFeriaPosgrado-v05--FINAL.pdf 

# $1
