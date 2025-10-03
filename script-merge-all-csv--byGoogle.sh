#!/bin/bash

# Define the output file name
OUTPUT_FILE="merged_output_$(date +"%Y-%m-%d_%H%M%S").txt"

# Remove the output file if it already exists to prevent appending to old data
#TODO rm -f "$OUTPUT_FILE"


# Get the header from the first CSV file and write it to the output file
# This assumes all CSV files have the same header structure
FIRST_FILE=$(find . -maxdepth 1 -name "*.csv" | head -n 1)
if [ -n "$FIRST_FILE" ]; then
    head -n 1 "$FIRST_FILE" > "$OUTPUT_FILE"
else
    echo "No CSV files found in the current directory."
    exit 1
fi

# Loop through all CSV files in the current directory
for file in *.csv; do
    # Skip the first file as its header is already processed (
    # if [ "$file" != "$(basename "$FIRST_FILE")" ]; then
    # Skip the output csv file just created
    if [ "$file" != "$(basename "$OUTPUT_FILE")" ]; then
        # Append the content of the file (skipping the header) to the output file
        tail -n +2 "$file" >> "$OUTPUT_FILE"
    fi
done

echo "All CSV files merged into $OUTPUT_FILE with a single header."

wc -l *.csv
echo "------restar (n_files)-1 líneas de header y es igual a:"
wc -l "$OUTPUT_FILE"
