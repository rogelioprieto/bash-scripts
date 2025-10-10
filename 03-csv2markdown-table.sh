#!/bin/bash
#date: 9/oct/2025
# Check if a CSV file is provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <input.csv>"
  exit 1
fi

CSV_FILE="$1"

# Read the header row and format it for Markdown
HEADER=$(head -n 1 "$CSV_FILE")
echo "| $(echo "$HEADER" | sed 's/,/ | /g') |"

# Create the separator row based on the number of columns in the header
NUM_COLUMNS=$(echo "$HEADER" | tr -cd ',' | wc -c)
SEPARATOR="|"
for (( i=0; i<=$NUM_COLUMNS; i++ )); do
  SEPARATOR+=" --- |"
done
echo "$SEPARATOR"

# Read the data rows and format them for Markdown
tail -n +2 "$CSV_FILE" | while IFS=',' read -r -a line; do
  ROW_OUTPUT="|"
  for cell in "${line[@]}"; do
    ROW_OUTPUT+=" $cell |"
  done
  echo "$ROW_OUTPUT"
done


