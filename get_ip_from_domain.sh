#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <input_file>"
    exit 1
fi

input_file="$1"
output_file="all_domains_ip.txt"

# Check if input file exists
if [ ! -f "$input_file" ]; then
    echo "Error: Input file not found."
    exit 1
fi

# Process each domain in the input file
while IFS= read -r domain; do
    # Use dig to get the IP address for the domain
    ip_address=$(dig +short "$domain")

    # Print the results to the output file
        echo -n "$ip_address" >> "$output_file"
done < "$input_file"

# Remove duplicate entries from the output file
awk '!seen[$0]++' "$output_file" > "$output_file.tmp" && mv "$output_file.tmp" "$output_file"
