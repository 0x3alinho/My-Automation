cat ssrf.txt | qsreplace "http://burp_id" >> ssrf_auto-ffuf.txt
ffuf -c -w ssrf_auto-ffuf.txt -u FUZZ
