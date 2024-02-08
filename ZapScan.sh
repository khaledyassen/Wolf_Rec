#!/bin/bash


echo "Please enter the path or name of the file:"
read file_input

# Check if file exists
if [ -e "$file_input" ]; then
    echo "File '$file_input' exists."
else
    echo "File '$file_input' does not exist or is inaccessible."
fi

OUTPUT_DIRECTORY="output"
counter=1

# Create the output directory if it doesn't exist
mkdir -p "$OUTPUT_DIRECTORY"

# Read the URLs from the input file
while read -r url; do
    # Run the tool for the URL and save the output to the output file
    zaproxy -cmd -quickurl "$url" -quickprogress -quickout "$pwd"output/output_$counter.xml
    
    # Increase the counter
    ((counter++))
done < "$file_input"
