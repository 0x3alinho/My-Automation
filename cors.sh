cat alive_links.txt  | rush -j200 'curl -m5 -s -I -H "Origin:evil.com" {} | [[ $(grep -c "evil.com") -gt 0 ]] && printf "\n\033[0;32m[VUL TO CORS] - {}\e[m"'
cat urls.txt | while read url; do target=$(curl -sIH "Origin: https://evil.com" -X GET $url) | if grep 'https://evil.com'; then [Potentional CORS Found] echo $url; else echo Nothing on "$url"; fi; done                                                                                                                 
                                               
