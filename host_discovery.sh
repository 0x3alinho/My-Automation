#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <input_file_containing_cidr_ranges>"
    exit 1
fi

input_file=$1

while IFS= read -r cidr; do
    nmap -n -Pn -sS "$cidr" | grep "for" | cut -d " " -f 5 >> IP.txt
done < "$input_file"

