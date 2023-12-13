#!/bin/bash

input_file="scope.txt"

while read domain; do
  
  curl -s "https://rapiddns.io/subdomain/$domain?full=1" \
    | grep -oP '_blank">\K[^<]*' \
    | grep -v http \
    | sort -u
done < "$input_file"
                         
