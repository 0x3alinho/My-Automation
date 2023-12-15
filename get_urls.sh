cat alive_subs.txt | waybackurls >> url1.txt
cat alive_subs.txt | gau --threads 5 --blacklist png,jpg,gif --o gau_result.txt
cat gau_result.txt >> url1.txt
rm gau_result.txt
katana -list alive_links.txt >> url1.txt
cat alive_links.txt | while read host; do waymore -i $host; done | anew more.txt
cat more.txt | sort -u >> url1.txt
cat url1.txt | sort -u >> urls.txt
rm url1.txt more.txt
cat urls.txt | grep application/json >> app_json.txt
cat urls | gauplus -subs | grep — -color -E. “.xls | \\. xml | \\.xlsx | \\.json | \\. pdf | \\.sql | \\. doc| \\.docx | \\. pptx| \\.txt| \\.zip| \\.tar.gz>
