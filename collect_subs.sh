#!/bin/bash
#echo "starting subfinder "
#subfinder
subfinder -dL scope.txt -silent >> all.txt
subfinder -dL scope.txt -recursive -silent -t 200 >> all.txt
#amass
#echo  "starting assetfinder"
#assetfinder
cat scope.txt | assetfinder -subs-only >> all.txt
#echo "starting subenum" 
#subenum
./subenum.sh -l scope.txt -s  >> all.txt
#security Trails
./security_trails.sh >> all.txt
#theHarveste
#echo "starting githup subs"
#githup
./githup_subs.sh scope.txt
cat githup_subs.txt >> all.txt
rm githup_subs.txt
#echo "starting brute forcing"
#brut_forcing
wget https://gist.githubusercontent.com/six2dez/a307a04a222fab5a57466c51e1569acf/raw
wget https://raw.githubusercontent.com/rajesh6927/subdomain-bruteforce-wordlist/main/Subdomain-wordlist.txt
cat raw Subdomain-wordlist.txt | sort -u >> my_word_list.txt
rm raw
#puredns bruteforce my_word_list.txt -d scope.txt -w puredns_result.txt
#cat puredns_result.txt >> all.txt
#rm puredns_result.txt
#echo "starting crt" 
#crt
./crt.sh scope.txt 
cat crt_out.txt >> all.txt
rm crt_out.txt
#archive
./archive_subs.sh
#echo "the script is ending"
#collect sub sub domains
subfinder -dL all.txt -silent >> all.txt
                                           
