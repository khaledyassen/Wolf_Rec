#!/usr/bin/env bash
jp2a The_Wolf.jpg
printf "\n";

# Subdomain Enumeration Function
   Subdomain_Enumeration(){
      while read -r domain; do
      echo "-------------------------------------------------------> Start the subdomain enumeration 🔥️☠️🔥️ ";
      printf "\n";
      echo "----------------------------------------------> Sublist3r is loading 🌚️🌚️... :( ";
      sublist3r -d $domain | anew subdomains.txt;
      printf "\n";
      echo "     #### Sublist3r is Ended ✅️✅️";
      printf "\n";
      echo "----------------------------------------------> Assetfinder is loading 🌚️🌚️... :) ";
      assetfinder $domain -subs-only | anew subdomains.txt;
      printf "\n";
      echo "     #### Assetfinder is Ended ✅️✅️";
      printf "\n";
      echo "----------------------------------------------> Subfinder is loading 🌚️🌚️...:) ";
      subfinder -d $domain | anew subdomains.txt;
      printf "\n";
      echo "     #### Subfinder is Ended ✅️✅️";
      printf "\n";
      echo "----------------------------------------------> Amass is my favourite tool is loading 🌚️🔥️...) ";
      amass enum -config amassAPI_config.ini -passive -d $domain | anew subdomains.txt;
      printf "\n";
      echo "     #### Amass is Ended ✅️✅️";
      echo "----------------------------------------------> Add your list to the file for more subdomains) ";
      cat subdomains_list.txt | while read subfuzz; do echo $subfuzz".$domain"; done | anew subdomains.txt;
      sleep 5
      printf "\n";
      printf "\n";
      done < scope.txt
   }
   
# Function for the httpx for live URLs
      Httpx_Function(){
         echo "-------------------------------------------------------> Start httpx 🔥️🔥️[live subdomains] and screenshots ";
         httpx --status-code -list subdomains.txt -p 80,443,8443,8000,5000,8080-o httpx.txt;
         sleep 5
         printf "\n";
         echo "-------------------------------------------------------> Start Flutteration 🌔️🌔️🔥️ ";
         printf "\n";
         echo "-------------------------------------------------------> Remove 404 🌚️🌚️:( ";
         printf "\n";
         cat httpx.txt | grep -v "404" | cut -d " " -f1 | anew ALLWithout404.txt;
         printf "\n";
      }
      
# Function for the subdomain takeover and open buckets scanning
       Subdomains_Scan_Takeover_And_Buckets(){
         echo "-------------------------------------------------------> Scan for subdomainTakeover using subzy 💝️💝️:(";
         printf "\n";
         cat httpx.txt | grep "404" | cut -d " " -f1 | anew 404.txt;
         subzy run --targets 404.txt | anew takeover.txt;
         printf "\n";
         echo "     #### Httpx and subdomain TakeOver is Ended ✅️✅️✅️✅️";
         printf "\n";
         echo "-------------------------------------------------------> Scan for open buckets using cloud_enum and s3scanner💝️:(";
         cat scope.txt >> buckets.txt;
         cat Domains.txt | anew buckets.txt;
         python3 cloud_enum/cloud_enum.py -kf buckets.txt -qs >> Cloud_Result.txt;
         echo "     #### cloud enum scanner is ended ✅️✅️✅️✅️";
         sleep 5
         printf "\n";
         cat subdomains.txt | anew buckets.txt;
         s3scanner -bucket-file buckets.txt | anew s3scanner_Response.txt;
         cat s3scanner_Response.txt | | grep -v "not_exist" | grep -v "invalid" | anew Open_Buckets.txt
         echo "     ####  s3scanner is ended ✅️✅️✅️✅️";
         sleep 5
         printf "\n";
       }

   cat httpx.txt | cut -d " " -f1 | unfurl domains | anew Domains.txt;

# Function for the Crawling
      Crawling(){
         echo "-------------------------------------------------------> param spider 🔗️💝️:(";
         while read Line; do
          python3 ParamSpider/paramspider.py -d "$Line" -o "$Line".txt
         done < Domains.txt
         cat output/*.txt | anew parameters.txt;
         cat parameters.txt | anew Endpoints.txt;
         echo "     #### param spider is ended ✅️✅️✅️✅️";
         sleep 5
         printf "\n";
         echo "-------------------------------------------------------> Gathering endpoints using gau and katana 🔗️🔗️🔥️🔗️ ";
         printf "\n";
         printf "\n";
         echo "-------------------------------------------------------> Gau is comming 🔗️🔥️ ";
         cat Domains.txt | gau --blacklist png,jpg,gif,css,ttf,woff,svg --threads 2 | /usr/local/bin/uro | anew Endpoints.txt;
         sleep 6
         echo "-------------------------------------------------------> Let's crawling using katana 🔗️🔥️ ";
         cat ALLWithout404.txt | katana -d 3 -jc -delay 10 | /usr/local/bin/uro | anew Katana.txt;
         sleep 6
         echo "-------------------------------------------------------> Let's Get the live of them for nuclei 🔥️ ";
         cat Endpoints.txt | hakcheckurl | anew LiveEndpoints.txt;
         cat Katana.txt | anew LiveEndpoints.txt;
         sleep 5
      }

   
# Function for the port scan [Nmap]
      Nmap(){
         echo "-------------------------------------------------------> Using Nmap scanner for scanning open ports 🔍️🔍️🔍️ ";
         printf "\n";
         nmap --open -iL Domains.txt -sS -Pn -T4 -oA NmapScanerResutl;
         printf "\n";
         echo "     #### Nmap scanner is ended ✅️✅️✅️✅️";
         sleep 5
         printf "\n";
      }
      
# Function for the knwon CVE
      CVE_Scan(){
         echo "-------------------------------------------------------> 🔥️☠️😎️ jaeles scanner for all 🔥️ ";
         printf "\n";
         cat httpx.txt | cut -d " " -f1 | anew jaeles.txt;
         cat LiveEndpoints.txt | /usr/local/bin/uro | cut -d " " -f1 | anew jaeles.txt;
         jaeles scan -c 80 -U jaeles.txt -o output2;
         printf "\n";
         echo "     #### jaeles scanner is ended ✅️✅️✅️✅️";
         sleep 6
         printf "\n";
      }

# Port scan
echo "Do you want to Scan for open ports (Yes/No)? "
read user_input1
user_input_lowercase1=$(echo "$user_input1" | tr '[:upper:]' '[:lower:]')

# Check the user's input and decide whether to execute the function
if [ "$user_input_lowercase1" == "yes" ]; then
    echo "Good luck with the port scan using Nmap"
elif [ "$user_input_lowercase1" == "no" ]; then
    echo "Execution of the Nmap is skipped."
else
    echo "Invalid input. Please enter 'Yes' or 'No'."
fi

# CVE Scan
echo "Do you want to Scan for known CVEs (Yes/No)? "
read user_input2
user_input_lowercase2=$(echo "$user_input2" | tr '[:upper:]' '[:lower:]')

# Check the user's input and decide whether to execute the function
if [ "$user_input_lowercase2" == "yes" ]; then
    echo "Good luck with the known CVEs Scan"
elif [ "$user_input_lowercase2" == "no" ]; then
    echo "Execution of the CVE_Scan is skipped."
else
    echo "Invalid input. Please enter 'Yes' or 'No'."
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
echo "-------------------------------------------------------> Thanks :) made by @khaledyasse1882 🔥️ <----------------------------------------------------";
