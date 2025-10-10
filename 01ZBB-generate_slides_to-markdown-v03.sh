#!/bin/bash
# Rogelio Prieto Alvarado
# 07/oct/2025
# Objective: generate slides in markdown format. A slide for each png file in the current directory.


# One-liner version
#echo -e "% Presentation\n% $(whoami)\n% $(date +%Y-%m-%d)\n" > slides.md && \
#for img in *.png; do echo -e "# ${img%.*}\n\n![$img]($img)\n\n---\n"; done >> slides.md && \
#echo "Generated slides.md with $(ls *.png | wc -l) slides"

set -e

# variables with default values
OUTPUT_FILE="slides.md"
TITLE="${2:-Presentation}"
AUTHOR="${3:-$(whoami)}"
DATE="${4:-$(date +%Y-%m-%d)}"


# count png files
png_count=$(ls *.png | wc -l)
#echo "Generating $OUTPUT_FILE with $png_count slides..."

# generate the output file
# first, create the markdown header
echo -e "% ${TITLE}\n% ${AUTHOR}\n% ${DATE}\n" > $OUTPUT_FILE



# add a section slide
echo "# kNN using Standard Scaler">> $OUTPUT_FILE
# add a slide for each png file
for img in knn-try02-StandardScaler-*.png; do
    echo -e "## \n\n![$img]($img)\n\n---\n"
done >> $OUTPUT_FILE 

echo -e "## \n\n$(cat knn-try02-StandardScaler-*best-values.txt)\n\n---\n" >> $OUTPUT_FILE

# add a section slide
echo "# kNN using Robust Scaler">> $OUTPUT_FILE
# add a slide for each png file
for img in knn-try02-RobustScaler-*.png; do
    echo -e "## \n\n![$img]($img)\n\n---\n"
done >> $OUTPUT_FILE 

echo -e "## kNN using RobustScaler - Results \n\n$(cat knn-try02-RobustScaler-*best-values.txt)\n\n---\n" >> $OUTPUT_FILE


echo -e "## kNN. Standard vs Robust Scaler Results \n\n$(cat knn-try02-StandardScaler-*best-values.txt)\n\n\n\n$(cat knn-try02-RobustScaler-*best-values.txt)\n\n---\n" >> $OUTPUT_FILE

echo "slides.md was generated with $png_count slides."

# add a section slide
#echo "# Section">> $OUTPUT_FILE
# add a slide for each png file
#for img in *.png; do
#    echo -e "## \n\n![$img]($img)\n\n---\n"
#done >> $OUTPUT_FILE && echo "slides.md was generated with $png_count slides."
