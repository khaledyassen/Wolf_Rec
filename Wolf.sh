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
echo "    Wolf+MNK0XNMMMMMMMMMMMMMMMMWXKKNW+Wolf"
echo "    MMMMMK;..';xNMMMMMMMMMMMMNO:'..'OWMMMM"
echo "    MMMMNc x0Kx..dNWMMMMMMMNk'.d00k.,XMMMM"
echo "    MMMMX',Ox0WN' .l00OO00d' .KW0xOc KWMMM"
echo "    MMMMK.:Od'oW:.;........,.'Nx'l0o OWMMM"
echo "    MMMWK 'dK' ..';:::::::::,.. .Kx; xWMMM"
echo "    MMMW0 :dk' lc::::::::::::cl..xoo dNMMM"
echo "    MMMNd  ;:;,c:clll::::lllc:c;;;c. :NMMM"
echo "    MWXx. .:lcc:loloo:::;oollo:cclc.  oXWM"
echo "    N0l .:lc::ddo;.l:.::.;l''oodc::lc. :ON"
echo "    WK'.l:;;''xlc' ..;:::.. .ccx;.;;;l'.OW"
echo "    Nl '.;:,. .dNXdccc:::cllKNk' .,::.'.;X"
echo "    X;  .;cc' ..'kOdkklckOdOO;.. .:l;.  .X"
echo "    N:. .lko.k;'lc000OOkOKOKol,,O'lkd. .'X"
echo "    W0k' k; lOd..l0XXNKKXNXKl; lOx 'k..x0W"
echo "    MWNO.'  lccc..WW,.  ..XM; l;ld  ' dNWM"
echo "    XMMWO. ..'c,  dNx,  'oNO. ,,;....xNMMK"
echo "    0MMMMXlko .... .,cccc;. . .. :0cKWMMMO"
echo "    MMMMMMWNNk.  .;. .... .,. ..dNNWMMMMMW"
echo "    MMMMMMMMMMNxd, ;c    ;c..oxXMMMMMMMMMM"
echo "    MMMMMMMMMMMMWN0l,'. .'cONWMMMMMMMMMMMM"
echo "    Wolf+MMMMMMMMMMMWKc:ONMMMMMMMMMMM+Wolf"
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
         echo -e "${BOLD}${RED}-------------------------------------------------------> Using uncover to get the IPs from the scope 🔍️🔍️🔍️ ${RESET}";
         echo -e "${BOLD}${GREEN}Enter the API key for shodan ${RESET})? "
         read user_input_SHODAN_key
         echo -e "${BOLD}${GREEN}Enter the API ID for censys ${RESET})? "
         read user_input_CENSYS_API_ID
         echo -e "${BOLD}${GREEN}Enter the API secret for censys ${RESET})? "
         read user_input_CENSYS_API_secret
         export SHODAN_API_KEY=user_input_SHODAN_key;
         export CENSYS_API_ID=user_input_CENSYS_API_ID;
         export CENSYS_API_SECRET=user_input_CENSYS_API_secret;
         cat scope.txt | uncover -e shodan,censys | grep -E -o "([0-9]{1,3}[\\.]){3}[0-9]{1,3}" | anew Domains.txt; 
         echo -e "${BOLD}${RED}-------------------------------------------------------> Using Nmap scanner for scanning open ports 🔍️🔍️🔍️ ${RESET}";
         printf "\n";
         nmap --open -iL Domains.txt -sS -Pn -T3 -oA NmapScanerResutl;
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
