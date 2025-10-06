#!/bin/bash

# Define the output file name
OUTPUT_FILE="merged_output_$(date +"%Y-%m-%d_%H%M%S").csv"


# This assumes all CSV files have the same header structure
FIRST_FILE=$(find . -maxdepth 1 -name "*.csv" | head -n 1)
# Get the input filenames
LIST_FILES=$(ls *.csv)

# Get the header from the first CSV file and write it to the output file
# and the content from every input file and append to the output file
head -n 1 $FIRST_FILE > ${OUTPUT_FILE} && echo $LIST_FILES | xargs -n1 tail +2 >> ${OUTPUT_FILE} 


#Show the output
echo "---"
echo "All CSV files merged into $OUTPUT_FILE with a single header."

wc -l $LIST_FILES
wc -l "$OUTPUT_FILE"


CSV_COUNTER=$(find . -maxdepth 1 -type f -name "*.csv" | wc -l)
HEADER_LINES_OMMITED=$(($CSV_COUNTER-2)) #n_files -1 are the header lines not included and -1 for counting the output file
OUTPUT_LINES=$(wc -l "$OUTPUT_FILE" | cut -d" " -f1)
SUM=$((OUTPUT_LINES + HEADER_LINES_OMMITED))
echo -e "\n"$SUM"-"$HEADER_LINES_OMMITED"="$OUTPUT_LINES
echo $HEADER_LINES_OMMITED" header lines were ommited intentionally."
echo "---"

#Previous script version used
#cat F1-xy-variables.csv > all-BORRAR.csv && echo "F2-xy-variables.csv M1-xy-variables.csv  M2-xy-variables.csv" | xargs -t -n1 tail +2 >> all-BORRAR.csv && wc -l all-BORRAR.csv
