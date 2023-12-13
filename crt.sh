#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <input_file>"
  exit 1
fi

input_file="scope.txt"

if [ ! -f "$input_file" ]; then
  echo "Error: Input file not found: $input_file"
  exit 1
fi

# Define the crt() function
crt(){
 curl -s "https://crt.sh/?q=%25.$1" \
 | grep -oE "[\.a-zA-Z0-9-]+\.$1" \
 | sort -u
 }
 crt tesla.com

# Loop through each domain in the input file
while IFS= read -r domain; do
  # Run the crt() function and append the results to the output file
  crt "$domain" >> crt_out.txt
done < "$input_file"

# Optionally, you can remove duplicates from the output file
sort -u -o crt_out.txt crt_out.txt
                                        
