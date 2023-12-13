#!/bin/bash

# Check if the input file exists
input_file="scope.txt"
if [ ! -f "$input_file" ]; then
    echo "Error: Input file '$input_file' not found."
    exit 1
fi

# Loop through each domain in the input file
while IFS= read -r domain; do
    # Skip empty lines or lines starting with #
    if [[ -z "$domain" || "$domain" == \#* ]]; then
        continue
    fi

    # Run the command to collect subdomains using the specified API key
    subdomains=$(curl -s --request GET --url "https://api.securitytrails.com/v1/domain/$domain/subdomains?apikey=m1gy2rjKjd-EVpbacD2PPG4zEmCzdSpL" | jq -r '.subdomains[]' | sed "s/$/.$domain/")

    echo -e "$subdomains"

done < "$input_file"

                         
