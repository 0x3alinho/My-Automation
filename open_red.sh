cat redirection.txt | qsreplace "$LHOST" | xargs -I % -P 25 sh -c 'curl -Is "%" 2>&1 | grep -q "Location: $LHOST" && echo "VULN! %"’ >> open_redir_bugs.txt
cat redirection.txt | nuclei -t Url-Redirection-Catcher.yaml >> open_redir_bugs.txt
