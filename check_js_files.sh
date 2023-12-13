#!bin/bash

cat urls.txt | grep js | htppx -mc 200 | tee js.txt
#nuclei -l js.txt -t ~/nuclei-templates/exposures/ -o js_bugs.txt
#rm js.txt
               
