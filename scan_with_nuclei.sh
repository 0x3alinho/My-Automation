at urls.txt | gf lfi >> lfi.txt
cat urls.txt | gf idor >> idor.txt
cat urls.txt | gf rce >> rce.txt
cat urls.txt | gf redirect >> redirection.txt
cat urls.txt | gf ssrf >> ssrf.txt
cat urls.txt | gf upload-fields >> file_upload.txt
cat lfi.txt idor.txt rce.txt redirection.txt ssrf.txt file_upload.txt | sort -u >> vuln_links.txt
cat vuln_links.txt | nuclei -t ~/nuclei-templates -es info,unknown -etags ssl,network -o nuclei_1.txt
cat alive_links.txt | nuclei -t ~/nuclei-templates -es info,unknown -etags ssl,network -o nuclei_2.txt
cat urls.txt | nuclei -t ~/nuclei-templates -es info,unknown -etags ssl,network -o nuclei_3.txt
cat nuclei_1.txt >> nuclei_result.txt
cat nuclei_2.txt >> nuclei_result.txt
cat nuclei_3.txt >> nuclei_result.txt 
cat nuclei_result.txt | sort -u  >> my_nuclei_result.txt
rm nuclei_1.txt nuclei_2.txt nuclei_3.txt nuclei_result.txt



