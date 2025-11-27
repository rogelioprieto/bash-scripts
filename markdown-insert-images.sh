#!/bin/bash
# Rogelio Prieto Alvarado
# 07/oct/2025
# Objective: insert images into a file with markdown format.


# One-liner version
#echo -e "% Presentation\n% $(whoami)\n% $(date +%Y-%m-%d)\n" > slides.md && \
#for img in *.png; do echo -e "# ${img%.*}\n\n![$img]($img)\n\n---\n"; done >> slides.md && \
#echo "Generated slides.md with $(ls *.png | wc -l) slides"

set -e

# variables with default values
OUTPUT_FILE="all-images.md"

#my custom-values
TITLE="Images in "$(pwd)
AUTHOR="Rogelio Prieto A."
DATE=$(date +"%Y-%m-%d")



# count png files
png_count=$(ls *.png | wc -l)
#echo "Generating $OUTPUT_FILE with $png_count slides..."

# add a slide for each png file
for img in *.png; do
    echo -e "\n\n![$img]($img)\n\n---\n"
done >> $OUTPUT_FILE 


echo "---"
echo "$OUTPUT_FILE was generated with $png_count slides."
echo "---"

