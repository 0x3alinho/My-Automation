#!/bin/bash
OUTPUT_FILE="harv_result.txt"
DOMAINS_FILE="scope.txt"
while IFS= read -r domain; do
     theHarvester -d $domain -b all | grep -Eo '[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}' >> $OUTPUT_FILE
done < "$DOMAINS_FILE"
cat harv_result.txt >> all.txt
rm harv_result.txt
