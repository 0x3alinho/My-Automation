#!/bin/bash

input_file="scope.txt"

if [ ! -f "$input_file" ]; then
  echo "Error: Input file not found: $input_file"
  exit 1
fi

# Define the archive() function
archive(){
 curl -s "http://web.archive.org/cdx/search/cdx?url=*.$1/*&output=text&fl=original&collapse=urlkey" | awk -F/ '{print $3}'
 }
 

# Loop through each domain in the input file
while IFS= read -r domain; do
  # Run the crt() function and append the results to the output file
  archive "$domain" >> archive_subs.txt
done < "$input_file"

# Optionally, you can remove duplicates from the output file
sort -u -o archive_subs.txt archive_subs.txt                                   
cat archive_subs.txt | sed 's/[:?].*//' >> all.txt
rm archive_subs.txt
                                          
