#!/usr/bin/env bash
figlet "                                       The_Wolf" | lolcat
printf "\n";
while read -r domain; do
   echo "-------------------------------------------------------> Start Reconnaissance 🔥️🔥️☠️🔥️ ";
   printf "\n";
   echo "----------------------------------------------> Sublist3r is loading 🌚️🌚️... [good] 🤧️🤧️🤧️:( ";
   sublist3r -d $domain | anew subdomains.txt;
   printf "\n";
   echo "     #### Sublist3r is Ended ✅️✅️";
   printf "\n";
   echo "----------------------------------------------> Assetfinder is loading 🌚️🌚️... [normal] 😬️😬️😬️:) ";
   assetfinder $domain -subs-only | anew subdomains.txt;
   printf "\n";
   echo "     #### Assetfinder is Ended ✅️✅️";
   printf "\n";
   echo "----------------------------------------------> Subfinder is loading 🌚️🌚️... [very good] 🥰️😘️🥰️:) ";
   subfinder -d $domain | anew subdomains.txt;
   printf "\n";
   echo "     #### Subfinder is Ended ✅️✅️";
   printf "\n";
   echo "----------------------------------------------> Amass is my favourite tool is loading 🌚️🔥️... [Great] 😍️💝️💝️🥰️:) ";
   amass enum -config amassAPI_config.ini -passive -d $domain | anew subdomains.txt;
   printf "\n";
   echo "     #### Amass is Ended ✅️✅️";
   echo "----------------------------------------------> Add your list to the file for more subdomains 💝️🥰️🌚️ [optional]:) ";
   cat subdomains_list.txt | while read subfuzz; do echo $subfuzz".$domain"; done | anew subdomains.txt;
   sleep 5
   printf "\n";
   printf "\n";
done < scope.txt
   echo "-------------------------------------------------------> Start httpx 🙈️🙈️🔥️🔥️[live subdomains] and screenshots ";
   httpx --status-code -list subdomains.txt -p 80,443,8443,8000,5000,8080-o httpx.txt;
   sleep 5
   printf "\n";
   echo "-------------------------------------------------------> Start Flutteration 🌔️🌔️🔥️ ";
   printf "\n";
   echo "-------------------------------------------------------> Remove 404 🌚️🌚️:( ";
   printf "\n";
   cat httpx.txt | grep -v "404" | cut -d " " -f1 | anew ALLWithout404.txt;
   printf "\n";
   echo "-------------------------------------------------------> Scan for subdomainTakeover using subzy 💝️💝️:(";
   printf "\n";
   cat httpx.txt | grep "404" | cut -d " " -f1 | anew 404.txt;
   subzy run -targets 404.txt | anew takeover.txt;
   printf "\n";
   echo "     #### Httpx and subdomain TakeOver is Ended ✅️✅️✅️✅️";
   printf "\n";
   echo "-------------------------------------------------------> Using Nmap scanner for scanning open ports 🔍️🔍️🔍️ ";
   printf "\n";
   cat httpx.txt | cut -d " " -f1 | unfurl domains | anew Domains.txt;
   nmap --open -iL Domains.txt -Pn -T3 -oA NmapScanerResutl;
   printf "\n";
   echo "     #### Nmap scanner is ended ✅️✅️✅️✅️";
   sleep 5
   printf "\n";
   echo "-------------------------------------------------------> Scan for buckets using cloud_enum 💝️:(";
   cat scope.txt >> buckets.txt;
   cat Domains.txt | anew buckets.txt;
   python3 cloud_enum/cloud_enum.py -kf buckets.txt -qs >> Cloud_Result.txt;
   echo "     #### cloud enum scanner is ended ✅️✅️✅️✅️";
   sleep 5
   printf "\n";
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
   cat Endpoints.txt | httpx-toolkit --status-code -mc 200,403,401,400,301 -o LiveEndpoints.txt;
   cat Katana.txt | anew LiveEndpoints.txt;
   sleep 5
   echo "-------------------------------------------------------> 🔥️☠️😎️ jaeles scanner for all  ❤️‍🔥️❤️‍🔥️🔥️ ";
   printf "\n";
   cat httpx.txt | cut -d " " -f1 | anew jaeles.txt;
   cat LiveEndpoints.txt | /usr/local/bin/uro | cut -d " " -f1 | anew jaeles.txt;
   jaeles scan -c 80 -U jaeles.txt -o output2;
   printf "\n";
   echo "     #### jaeles scanner is ended ✅️✅️✅️✅️";
   sleep 6
   printf "\n";
   echo "-------------------------------------------------------> 🔥️☠️😎️ Nuclei scanner for all ❤️‍🔥️❤️‍🔥️🔥️ ";
   printf "\n";
   cat httpx.txt | cut -d " " -f1 | anew nuclei.txt;
   cat LiveEndpoints.txt | /usr/local/bin/uro | cut -d " " -f1 | anew nuclei.txt;
   cat nuclei.txt | nuclei -o Nuclei_Result.txt;
   printf "\n";
   echo "     #### Nuclei scanner is ended ✅️✅️✅️✅️";
   printf "\n";
   echo "-------------------------------------------------------> Thanks :) made by @khaledyasse1882 🔥️🔥️🥰️🥰️ <----------------------------------------------------";
