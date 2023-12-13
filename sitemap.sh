ffuf -w alive_links.txt:FUZZ -u FUZZ/sitemap.xml -mr "loc" -c -of csv -o vulnerable_sitemap_urls.txt
