#!/bin/bash

# Change the values of these variables as needed
INPUT_FILE="zapscan_URLS.txt"
OUTPUT_DIRECTORY="output"
counter=1

# Create the output directory if it doesn't exist
mkdir -p "$OUTPUT_DIRECTORY"

# Read the URLs from the input file and iterate over them
while read -r url; do
    # Generate the output filename based on the counter    
    
    # Run the tool for the URL and save the output to the output file
    zaproxy -cmd -quickurl "$url" -quickprogress -quickout /root/Targets/Zap/output/output_$counter.xml
    
    # Increase the counter
    ((counter++))
done < "$INPUT_FILE"
