#!bin/bash

./host_discovery.sh cidr.txt
./get_ip_from_domain.sh all_subs.txt 
cat all_domains_ip.txt >> IP.txt
cat IP.txt | sort -u >> ips.txt
rm all_domains_ip.txt IP.txt

masscan -p1-65535 -iL ips.txt -oG masscan_result.txt

#nmap -O -sV -iL ips.txt -oN nmap_result.txt --script=vuln&
