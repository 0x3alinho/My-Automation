
#uniq subs
cat all.txt | sort -u >> all_subs.txt
rm all.txt

#filter
httpx -list all_subs.txt -sc -silent >> alive_links.txt
cat all.txt | httpx -silent -follow-redirects -mc 200 >> 200.txt
cat alive_links.txt >> alive_with_stuts_code.txt
sed -i 's/\[[^]]*\]//g' alive_links.txt 
cat alive_links.txt | grep -oP '(?<=://)[^/]+' >> alive_subs.txt
cat alive_with_stuts_code.txt | grep 403 | sed -i 's/\[[^]]*\]//g' >> 403.txt
