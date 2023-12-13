ffuf -w alive_links.txt:FUZZ/.git/config -u FUZZ/.git/config -mr "[core]" -c -o open_git_repos.txt -of csv
