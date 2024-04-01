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
      sublist3r -d $domain | anew output/subdomains.txt;
      printf "\n";
      echo -e "${BOLD}${GREEN}     #### Sublist3r Ended ✅️✅️${RESET}";
      printf "\n";
      echo -e "${BOLD}${BLUE}----------------------------------------------> Assetfinder is loading 🌚️🌚️... :) ${RESET}";
      assetfinder $domain -subs-only | anew output/subdomains.txt;
      printf "\n";
      echo -e "${BOLD}${GREEN}     #### Assetfinder Ended ✅️✅️${RESET}";
      printf "\n";
      echo -e "${BOLD}${BLUE}----------------------------------------------> Subfinder is loading 🌚️🌚️...:) ${RESET}";
      subfinder -d $domain | anew output/subdomains.txt;
      printf "\n";
      echo -e "${BOLD}${GREEN}     #### Subfinder Ended ✅️✅️${RESET}";
      printf "\n";
      echo -e "${BOLD}${BLUE}----------------------------------------------> Amass is my favourite tool is loading 🌚️🔥️...) ${RESET}";
      amass enum -config amassAPI_config.ini -passive -d $domain | anew output/subdomains.txt;
      printf "\n";
      echo -e "${BOLD}${GREEN}     #### Amass Ended ✅️✅️${RESET}";
      echo -e "${BOLD}${BLUE}----------------------------------------------> Add your list to the file for more subdomains) ${RESET}";
      cat subdomains_list.txt | while read subfuzz; do echo $subfuzz".$domain"; done | anew output/subdomains.txt;
      sleep 8
      printf "\n";
      printf "\n";
      done < scope.txt
   }
   
# Function for the httpx for live URLs
      Httpx_Function(){
         echo -e "${BOLD}${RED}-------------------------------------------------------> Start httpx 🔥️🔥️[live subdomains] and screenshots${RESET} ";
         naabu -p 80,81,300,443,591,593,832,981,1010,1311,2082,2087,2095,2096,2480,3000,3128,3333,4243,4567,4711,4712,4993,5000,5104,5108,5800,6543,7000,7396,7474,8000,8001,8008,8014,8042,8069,8080,8081,8088,8090,8091,8118,8123,8172,8222,8243,8280,8281,8333,8443,8500,8834,8880,8888,8983,9000,9043,9060,9080,9090,9091,9200,9443,9800,9981,12443,16080,18091,18092,20720,28017  -list output/subdomains.txt -o output/nabuu.txt;
         httpx --status-code -tech-detect -screenshots -list output/nabuu.txt -t 20 -o output/httpx.txt;
         sleep 12
         printf "\n";
         echo -e "${BOLD}${GREEN}-------------------------------------------------------> Start Fultteration 🌔️🌔️🔥️ ${RESET}";
         printf "\n";
         echo -e "${BOLD}${BLUE}-------------------------------------------------------> Remove 404 🌚️🌚️:( ${RESET}";
         printf "\n";
         echo -e "${UNDERLINE}${BOLD}${RED}"
         cat output/httpx.txt | grep -v "404" | cut -d " " -f1 | anew output/ALLWithout404.txt;
         echo -e "${RESET}"
         printf "\n";
      }
      
# Function for the subdomain takeover and open buckets scanning
       Subdomains_Scan_Takeover_And_Buckets(){
         echo -e "${BOLD}${BLUE}-------------------------------------------------------> Scan for subdomainTakeover using subzy 💝️💝️:(${RESET}";
         printf "\n";
         cat output/httpx.txt | grep "404" | cut -d " " -f1 | anew output/404.txt;
         subzy run --targets output/404.txt | anew output/takeover.txt;
         printf "\n";
         echo -e "${BOLD}${GREEN}     #### Httpx and subdomain TakeOver Ended ✅️✅️✅️✅️${RESET}";
         printf "\n";
         echo -e "${BOLD}${RED}-------------------------------------------------------> Scan for open buckets using cloud_enum and s3scanner💝️:(${RESET}";
         cat scope.txt >> output/buckets.txt;
         cat output/Domains.txt | anew output/buckets.txt;
         python3 cloud_enum/cloud_enum.py -kf output/buckets.txt -qs >> output/Cloud_Result.txt;
         echo -e "${BOLD}${GREEN}     #### cloud enum scanner ended ✅️✅️✅️✅️${RESET}";
         sleep 10
         printf "\n";
         cat output/subdomains.txt | anew output/buckets.txt;
         s3scanner -bucket-file output/buckets.txt | anew output/s3scanner_Response.txt;
         cat output/s3scanner_Response.txt | grep -v "not_exist" | grep -v "invalid" | anew output/Open_Buckets.txt
         echo -e "${BOLD}${BLUE}     ####  s3scanner ended ✅️✅️✅️✅️${RESET}";
         sleep 10
         printf "\n";
       }

   cat output/httpx.txt | cut -d " " -f1 | unfurl domains | anew output/Domains.txt;

# Function for the Crawling
      Crawling(){
         echo -e "${BOLD}${RED}-------------------------------------------------------> Start param spider 🔗️💝️:(${RESET}";
        while read Line; do
         python3 ParamSpider/paramspider/main.py -d "$Line" -o output_P/"$Line".txt
         done < output/Domains.txt
         echo -e "${UNDERLINE}${BOLD}${BLUE}"
         cat output_P/*.txt | anew output/parameters.txt;
         cat output/parameters.txt | anew output/Endpoints.txt;
         echo -e "${RESET}"
         echo -e "${BOLD}${BLUE}     #### param spider is ended ✅️✅️✅️✅️${RESET}";
         sleep 10
         printf "\n";
         echo -e "${BOLD}${RED}-------------------------------------------------------> Gathering endpoints using gau and katana 🔗️🔗️🔥️🔗️ ${RESET}";
         printf "\n";
         printf "\n";
         echo -e "${BOLD}${YELLOW}-------------------------------------------------------> Gau is comming 🔗️🔥️ ${RESET}";
         echo -e "${UNDERLINE}${BOLD}${BLUE}"
         cat scope.txt | gau --blacklist png,jpg,gif,css,ttf,woff,svg --threads 5 | anew output/Endpoints.txt;
         echo -e "${RESET}"
         sleep 10
         echo -e "${BOLD}${GREEN}-------------------------------------------------------> Let's crawling using katana 🔗️🔥️ ${RESET}";
         echo -e "${UNDERLINE}${BOLD}${BLUE}"
         cat output/ALLWithout404.txt | katana -jc -delay 2 | anew output/Endpoints.txt;
         echo -e "${RESET}"
         sleep 10
         echo -e "${BOLD}${BLUE}-------------------------------------------------------> Let's Get the live of them for jaeles 🔥️ ${RESET}";
         cat output/Endpoints.txt | /home/$USER/.local/bin/uro  | anew Endpoints_Filtered.txt;
         cat output/Endpoints_Filtered.txt | hakcheckurl | anew output/LiveEndpoints.txt;
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
         echo -e "${BOLD}${GREEN}Enter the Email for fofa ${RESET})? "
         read user_input_FOFA_EMAIL
         echo -e "${BOLD}${GREEN}Enter the KEY for fofa ${RESET})? "
         read user_input_FOFA_KEY
         export SHODAN_API_KEY=user_input_SHODAN_key;
         export CENSYS_API_ID=user_input_CENSYS_API_ID;
         export CENSYS_API_SECRET=user_input_CENSYS_API_secret;
         export FOFA_EMAIL=user_input_FOFA_EMAIL;
         export FOFA_KEY=user_input_FOFA_KEY;
         cat scope.txt | uncover -e shodan,censys,fofa | grep -E -o "([0-9]{1,3}[\\.]){3}[0-9]{1,3}" | anew output/Domains.txt; 
         echo -e "${BOLD}${RED}-------------------------------------------------------> Using Nmap scanner for scanning open ports 🔍️🔍️🔍️ ${RESET}";
         printf "\n";
         sudo nmap --open -iL output/Domains.txt -sS -Pn -T3 -oA output/NmapScanerResutl;
         printf "\n";
         echo -e "${BOLD}${GREEN}     #### Nmap scanner is ended ✅️✅️✅️✅️${RESET}";
         sleep 12
         printf "\n";
      }
      
# Function for the knwon CVE
      CVE_Scan(){
         echo -e "${BOLD}${RED}-------------------------------------------------------> 🔥️☠️😎️ jaeles scanner for all 🔥️ ${RESET}";
         printf "\n";
         echo -e "${UNDERLINE}${BOLD}${BLUE}"
         cat output/httpx.txt | cut -d " " -f1 | anew output/jaeles.txt;
         cat output/LiveEndpoints.txt | /usr/local/bin/uro | cut -d " " -f1 | anew output/jaeles.txt;
         echo -e "${RESET}"
         jaeles scan -c 80 -U output/jaeles.txt -o output_jaels;
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
