#!/bin/bash

input_file="asn.txt"
output_file="cidr.txt"


while IFS= read -r asn; do
    result=$(whois -h whois.radb.net -- "-i origin $asn" | grep -Eo "([0-9.]+){4}/[0-9]+" | uniq)
    
    if [ -n "$result" ]; then
        echo "$result" >> "$output_file"
    fi        
    
done < "$input_file"

#sort the cidr
sort -u "$output_file" -o "$output_file"
                                            
