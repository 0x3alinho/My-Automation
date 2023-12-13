#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <input_file>"
  exit 1
fi

input_file="$1"

if [ ! -f "$input_file" ]; then
  echo "Error: Input file not found: $input_file"
  exit 1
fi

# Loop through each domain in the input file
while IFS= read -r domain; do
  # Run the github-subdomains command and append the results to the output file
  github-subdomains -d "$domain" -t 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 -raw >> githup_subs.txt
done < "$input_file"
