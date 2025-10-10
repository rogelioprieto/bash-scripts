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
#TITLE="${2:-Presentation}"
#AUTHOR="${3:-$(whoami)}"
#DATE="${4:-$(date +%Y-%m-%d)}"
#DATASET="${4:-$(echo "${PWD##*/}")}" #if parameter is empty, get the directory name

#my custom-values
TITLE="SMFC - ML Analysis"
AUTHOR="Rogelio Prieto A."
DATE="2025-10-08"
DATASET="${4:-$(echo "${PWD##*/}")}" #if parameter is empty, get the directory name


# count png files
png_count=$(ls *.png | wc -l)
#echo "Generating $OUTPUT_FILE with $png_count slides..."

# generate the output file
# first, create the markdown header
echo -e "% ${TITLE}\n% ${AUTHOR}\n% ${DATE}\n" > $OUTPUT_FILE

# add a slide to specify dataset
#echo -e "## Dataset\n\n${DATASET}\n\n$(($(wc -l merge*.csv | cut -d" " -f1)-1)) registros\n\n---\n" >> $OUTPUT_FILE
echo -e "## Dataset\n\n$(cat knn-try02-dataset.txt)\n\n---\n">> $OUTPUT_FILE

# add a section slide
echo "# kNN using Standard Scaler">> $OUTPUT_FILE
# add a slide for each png file
for img in knn-try02-StandardScaler-*.png; do
    echo -e "## \n\n![$img]($img)\n\n---\n"
done >> $OUTPUT_FILE 

# add slide to show the best values
echo -e "## kNN using Standard Scaler - Results \n\n$(cat knn-try02-StandardScaler-*best-values.txt)\n\n---\n" >> $OUTPUT_FILE

# add a section slide
echo "# kNN using Robust Scaler">> $OUTPUT_FILE
# add a slide for each png file
for img in knn-try02-RobustScaler-*.png; do
    echo -e "## \n\n![$img]($img)\n\n---\n"
done >> $OUTPUT_FILE 

# add slide to show the best values
echo -e "## kNN using Robust Scaler - Results \n\n$(cat knn-try02-RobustScaler-*best-values.txt)\n\n---\n" >> $OUTPUT_FILE

###Final section
# add a comparative slide
echo -e "## kNN. Standard vs Robust Scaler\n\n\
### kNN Standard Scaler\n\n \
$(cat knn-try02-StandardScaler-*best-values.txt)\n\n\n\n\
### kNN Robust Scaler\n\n\
$(cat knn-try02-RobustScaler-*best-values.txt)\n\n---\n" >> $OUTPUT_FILE


# add a section slide
echo "# Discussion & Feedback!">> $OUTPUT_FILE


echo "---"
echo "slides.md was generated with $png_count slides."
echo "---"


###
### a slide for each png file
###
# add a section slide
#echo "# Section">> $OUTPUT_FILE
# add a slide for each png file
#for img in *.png; do
#    echo -e "## \n\n![$img]($img)\n\n---\n"
#done >> $OUTPUT_FILE && echo "slides.md was generated with $png_count slides."

###
###
### a slide showing a csv file as table
#$(03-csv2markdown-table.sh knn-try02-StandardScaler-error-mse-and-r2.csv) \
