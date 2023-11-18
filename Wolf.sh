#!/bin/bash

# Define ANSI escape codes for colors and formatting
RESET="\033[0m"
BOLD="\033[1m"
ITALIC="\033[3m"
UNDERLINE="\033[4m"
RED="\033[91m"
GREEN="\033[92m"
YELLOW="\033[93m"
BLUE="\033[94m"

echo -e "${BOLD}${YELLOW}"
echo "    MMMMMMMWXd,..,lONWMMMMMMMMMMMMMMMMMMMWNKo;'.'l0NMMMMMMM"
echo "    MMMMMMWKc .;lc' 'dXWMMMMMMMMMMMMMMMWXO;..:l:. 'KNMMMMMM"
echo "    MMMMMMN0  dO0K0x' .dXWMMMMMMMMMMMWXO; .l00KOk. oXMMMMMM"
echo "    MMMMMMXo 'OOONNWX;  .dKNWWWWWWWWXk,  .0NNNOOOc ;KWMMMMM"
echo "    MMMMMWK: :OOccKMM0... .:c:::::cc'  . dWMNcckOx .KNMMMMM"
echo "    MMMMMWK, cOKl,.kMK, :;'...''''...,:..kMK.,,XOk .KNMMMMM"
echo "    MMMMMWK' ;x0N.. ', .'',;:::::::;,,'. .;  .kKkl  0NMMMMM"
echo "    MMMMMWK. :oxXk  .:clllllc::::::lllllc:'  cWOol. OXMMMMM"
echo "    MMMMMNK. cxlk' .ol:::::::::::::::::::co' .dodl. kXMMMMM"
echo "    MMMMMN0. ..d;..;l::cccclc:::::clcccc::cl...d,.  oXMMMMM"
echo "    MMMMNK:   ;ccollc:clooool:::::coooolc::lcolcc.  .OXMMMM"
echo "    MMWXKc   .;llccc:coo:oool;:::;cooo:lol::ccll:'   'OKNMM"
echo "    WNOl.  .col::::ldxx;.lolc.:::.;loo.'dxdoc:::col'  .:xXN"
echo "    WN0x. ,ol:;;;;dd;,c, .'..':::;..'. .:;,lk;;;;:coc. c0XN"
echo "    MN0. :o:,;;,..l00cc;..'.,::::::.'. ,:ck0x'.';;,;ll. dXW"
echo "    WK: ''.,ccc;' .cONW0d.c:::::::::c'lONW0l. .,:cc;'.; .KN"
echo "    NK.  ..,;'...    ;kKNKoxxo:::cxxoONX0c.    ...,;..   xX"
echo "    NK     ;,ddl' ..' ,kkxdkOOd:lOOOdxxkc .'. .:ox:;.    oX"
echo "    NK.   .,kOkl.ok..o;:0000OOOxOOO0O0Ko,d, lk.;kkO;.    xX"
echo "    MXl:'  l0o; :Xkk..xdoX0KWKKOKKNN0XklO' dxKx .lOx. .,lKW"
echo "    MNKOk  ld.  OOO, ..,OXN0NX0O0KNKXNN';  .0xX. .:k  lOKXM"
echo "    MMWXKl .;   O:x.:l .KMMl..   ..,NMW' ,o,o:K.  .; 'KXNMM"
echo "    WMMMWKc     :,x:': .0WMc.;. .:.'XMX, .l'O'd     '0NMMMN"
echo "    OMMMMWXo. '. .o..,  .xXXx,   .cXXO:  .: d...,. :KWMMMWx"
echo "    kMMMMMMN0;oO, .. ' .  .',,;;;;,'.  .... , .kk'xNMMMMMWd"
echo "    NMMMMMMMMNKXKc     '.   'ldxdo;.  .;     ,0XKXWMMMMMMMK"
echo "    MMMMMMMMMMMWWNk'..  ,c..        .;c  ...dXWWWMMMMMMMMMW"
echo "    MMMMMMMMMMMMMMWXxdl. .lx.     .od.  :xoKWMMMMMMMMMMMMMM"
echo "    MMMMMMMMMMMMMMMMWNXKx;..:,   ':. 'o0XNWMMMMMMMMMMMMMMMM"
echo "    MMMMMMMMMMMMMMMMMMMMWNKd;.. ..'o0NWMMMMMMMMMMMMMMMMMMMM"
printf "\n";
echo -e "${RESET}"

# Subdomain Enumeration Function
   Subdomain_Enumeration(){
      while read -r domain; do
      echo -e "${BOLD}${RED}-------------------------------------------------------> Start the subdomain enumeration 🔥️☠️🔥️ ${RESET}";
      printf "\n";
      echo -e "${BOLD}${BLUE}----------------------------------------------> Sublist3r is loading 🌚️🌚️... :( ${RESET}";
      sublist3r -d $domain | anew subdomains.txt;
      printf "\n";
      echo -e "${BOLD}${GREEN}     #### Sublist3r Ended ✅️✅️${RESET}";
      printf "\n";
      echo -e "${BOLD}${BLUE}----------------------------------------------> Assetfinder is loading 🌚️🌚️... :) ${RESET}";
      assetfinder $domain -subs-only | anew subdomains.txt;
      printf "\n";
      echo -e "${BOLD}${GREEN}     #### Assetfinder Ended ✅️✅️${RESET}";
      printf "\n";
      echo -e "${BOLD}${BLUE}----------------------------------------------> Subfinder is loading 🌚️🌚️...:) ${RESET}";
      subfinder -d $domain | anew subdomains.txt;
      printf "\n";
      echo -e "${BOLD}${GREEN}     #### Subfinder Ended ✅️✅️${RESET}";
      printf "\n";
      echo -e "${BOLD}${BLUE}----------------------------------------------> Amass is my favourite tool is loading 🌚️🔥️...) ${RESET}";
      amass enum -config amassAPI_config.ini -passive -d $domain | anew subdomains.txt;
      printf "\n";
      echo -e "${BOLD}${GREEN}     #### Amass Ended ✅️✅️${RESET}";
      echo -e "${BOLD}${BLUE}----------------------------------------------> Add your list to the file for more subdomains) ${RESET}";
      cat subdomains_list.txt | while read subfuzz; do echo $subfuzz".$domain"; done | anew subdomains.txt;
      sleep 30
      printf "\n";
      printf "\n";
      done < scope.txt
   }
   
# Function for the httpx for live URLs
      Httpx_Function(){
         echo -e "${BOLD}${RED}-------------------------------------------------------> Start httpx 🔥️🔥️[live subdomains] and screenshots${RESET} ";
         httpx --status-code -list subdomains.txt -p 80,443,8443,8000,5000,8080-o httpx.txt;
         sleep 30
         printf "\n";
         echo -e "${BOLD}${GREEN}-------------------------------------------------------> Start Fultteration 🌔️🌔️🔥️ ${RESET}";
         printf "\n";
         echo -e "${BOLD}${BLUE}-------------------------------------------------------> Remove 404 🌚️🌚️:( ${RESET}";
         printf "\n";
         echo -e "${UNDERLINE}${BOLD}${RED}"
         cat httpx.txt | grep -v "404" | cut -d " " -f1 | anew ALLWithout404.txt;
         echo -e "${RESET}"
         printf "\n";
      }
      
# Function for the subdomain takeover and open buckets scanning
       Subdomains_Scan_Takeover_And_Buckets(){
         echo -e "${BOLD}${BLUE}-------------------------------------------------------> Scan for subdomainTakeover using subzy 💝️💝️:(${RESET}";
         printf "\n";
         cat httpx.txt | grep "404" | cut -d " " -f1 | anew 404.txt;
         subzy run --targets 404.txt | anew takeover.txt;
         printf "\n";
         echo -e "${BOLD}${GREEN}     #### Httpx and subdomain TakeOver Ended ✅️✅️✅️✅️${RESET}";
         printf "\n";
         echo -e "${BOLD}${RED}-------------------------------------------------------> Scan for open buckets using cloud_enum and s3scanner💝️:(${RESET}";
         cat scope.txt >> buckets.txt;
         cat Domains.txt | anew buckets.txt;
         python3 cloud_enum/cloud_enum.py -kf buckets.txt -qs >> Cloud_Result.txt;
         echo -e "${BOLD}${GREEN}     #### cloud enum scanner ended ✅️✅️✅️✅️${RESET}";
         sleep 15
         printf "\n";
         cat subdomains.txt | anew buckets.txt;
         s3scanner -bucket-file buckets.txt | anew s3scanner_Response.txt;
         cat s3scanner_Response.txt | grep -v "not_exist" | grep -v "invalid" | anew Open_Buckets.txt
         echo -e "${BOLD}${BLUE}     ####  s3scanner ended ✅️✅️✅️✅️${RESET}";
         sleep 30
         printf "\n";
       }

   cat httpx.txt | cut -d " " -f1 | unfurl domains | anew Domains.txt;

# Function for the Crawling
      Crawling(){
         echo -e "${BOLD}${RED}-------------------------------------------------------> Start param spider 🔗️💝️:(${RESET}";
        while read Line; do
         python3 ParamSpider/paramspider.py -d "$Line" -o "$Line".txt
         done < Domains.txt
         echo -e "${UNDERLINE}${BOLD}${BLUE}"
         cat output/*.txt | anew parameters.txt;
         cat parameters.txt | anew Endpoints.txt;
         echo -e "${RESET}"
         echo -e "${BOLD}${BLUE}     #### param spider is ended ✅️✅️✅️✅️${RESET}";
         sleep 15
         printf "\n";
         echo -e "${BOLD}${RED}-------------------------------------------------------> Gathering endpoints using gau and katana 🔗️🔗️🔥️🔗️ ${RESET}";
         printf "\n";
         printf "\n";
         echo -e "${BOLD}${YELLOW}-------------------------------------------------------> Gau is comming 🔗️🔥️ ${RESET}";
         echo -e "${UNDERLINE}${BOLD}${BLUE}"
         cat Domains.txt | gau --blacklist png,jpg,gif,css,ttf,woff,svg --threads 2 | /usr/local/bin/uro | anew Endpoints.txt;
         echo -e "${RESET}"
         sleep 15
         echo -e "${BOLD}${GREEN}-------------------------------------------------------> Let's crawling using katana 🔗️🔥️ ${RESET}";
         echo -e "${UNDERLINE}${BOLD}${BLUE}"
         cat ALLWithout404.txt | katana -d 3 -jc -delay 10 | /usr/local/bin/uro | anew Katana.txt;
         echo -e "${RESET}"
         sleep 20
         echo -e "${BOLD}${BLUE}-------------------------------------------------------> Let's Get the live of them for jaeles 🔥️ ${RESET}";
         cat Endpoints.txt | hakcheckurl | anew LiveEndpoints.txt;
         cat Katana.txt | anew LiveEndpoints.txt;
         sleep 5
      }

   
# Function for the port scan [Nmap]
      Nmap(){
         echo -e "${BOLD}${RED}-------------------------------------------------------> Using Nmap scanner for scanning open ports 🔍️🔍️🔍️ ${RESET}";
         printf "\n";
         nmap --open -iL Domains.txt -sS -Pn -T4 -oA NmapScanerResutl;
         printf "\n";
         echo -e "${BOLD}${GREEN}     #### Nmap scanner is ended ✅️✅️✅️✅️${RESET}";
         sleep 30
         printf "\n";
      }
      
# Function for the knwon CVE
      CVE_Scan(){
         echo -e "${BOLD}${RED}-------------------------------------------------------> 🔥️☠️😎️ jaeles scanner for all 🔥️ ${RESET}";
         printf "\n";
         echo -e "${UNDERLINE}${BOLD}${BLUE}"
         cat httpx.txt | cut -d " " -f1 | anew jaeles.txt;
         cat LiveEndpoints.txt | /usr/local/bin/uro | cut -d " " -f1 | anew jaeles.txt;
         echo -e "${RESET}"
         jaeles scan -c 80 -U jaeles.txt -o output2;
         printf "\n";
         echo -e "${BOLD}${GREEN}     #### jaeles scanner is ended ✅️✅️✅️✅️${RESET}";
         sleep 30
         printf "\n";
      }

# Port scan
echo -e "${BOLD}${GREEN}Do you want to Scan for open ports (${BLUE}Yes/${RED}No${RESET})? "
read user_input1
user_input_lowercase1=$(echo "$user_input1" | tr '[:upper:]' '[:lower:]')

# Check the user's input and decide whether to execute the function
if [ "$user_input_lowercase1" == "yes" ]; then
    echo -e "${BOLD}${BLUE}Good luck with the port scan using Nmap${RESET}"
elif [ "$user_input_lowercase1" == "no" ]; then
    echo -e "${BOLD}${BLUE}Execution of the Nmap is skipped.${RESET}"
else
    echo -e "${BOLD}${RED}Invalid input. Please enter 'Yes' or 'No'.${RESET}"
fi

# CVE Scan
echo -e "${BOLD}${GREEN}Do you want to Scan for known CVEs (${BLUE}Yes/${RED}No${RESET})? "
read user_input2
user_input_lowercase2=$(echo "$user_input2" | tr '[:upper:]' '[:lower:]')

# Check the user's input and decide whether to execute the function
if [ "$user_input_lowercase2" == "yes" ]; then
    echo -e "${BOLD}${BLUE}Good luck with the known CVEs Scan${RESET}"
elif [ "$user_input_lowercase2" == "no" ]; then
    echo -e "${BOLD}${BLUE}Execution of the CVE_Scan is skipped.${RESET}"
else
    echo -e "${BOLD}${RED}Invalid input. Please enter 'Yes' or 'No'.${RESET}"
fi


# Execute the Functions
if [ "$user_input_lowercase1" = "yes" ] && [ "$user_input_lowercase2" = "yes" ]; then
   Subdomain_Enumeration
   Httpx_Function
   Subdomains_Scan_Takeover_And_Buckets
   Crawling
   Nmap
   CVE_Scan
elif [ "$user_input_lowercase1" = "no" ] && [ "$user_input_lowercase2" = "yes" ]; then
   Subdomain_Enumeration
   Httpx_Function
   Subdomains_Scan_Takeover_And_Buckets
   Crawling
   CVE_Scan
elif [ "$user_input_lowercase1" = "yes" ] && [ "$user_input_lowercase2" = "no" ]; then
   Subdomain_Enumeration
   Httpx_Function
   Subdomains_Scan_Takeover_And_Buckets
   Crawling
   Nmap
elif [ "$user_input_lowercase1" = "no" ] && [ "$user_input_lowercase2" = "no" ]; then
   Subdomain_Enumeration
   Httpx_Function
   Subdomains_Scan_Takeover_And_Buckets
   Crawling   
fi

printf "\n";
echo -e "${ITALIC}${BOLD}-------------------------------------------------------> ${RED}Thanks :) created by ${GREEN}@khaledyasse1882 ${RESET}🔥️ <----------------------------------------------------${RESET}";
