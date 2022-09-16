#! /bin/bash
#  Requirements ⬇️⬇️

echo "---------------------> Note 📝️📝️: You need to change the path of githubsubdomains tool and chromium for aquatone to your own PATH <-------------------";
printf "\n";
cat scope.txt | while read domain 
do
   echo "-----------------------------------------------> Start Reconnaissance 🔥️🔥️👽️👽️🔥️ <------------------------------------------------------- ";
   printf "\n";
   echo "----------------------------------------------> Sublist3r is loading 🌚️🌚️... [bad] 🤧️🤧️🤧️:( <---------------------------------------------";
   sublist3r -d $domain | anew subdomains.txt;
   printf "\n";
   echo "#### Sublist3r is Ended ✅️✅️";
   printf "\n";
   echo "---------------------------------------------> Assetfinder is loading 🌚️🌚️... [normal] 😬️😬️😬️:) <--------------------------------------------";
   assetfinder $doamin | anew subdomains.txt;
   printf "\n";
   echo "#### Assetfinder is Ended ✅️✅️";
   printf "\n";
   echo "---------------------------------------------> Findomain is loading 🌚️🌚️... [Nice] 😇️😇️😇️:) <-------------------------------------------------";
   findomain -t $domain | anew subdomains.txt
   printf "\n";
   echo "#### Findomain is Ended ✅️✅️";
   printf "\n";
   echo "---------------------------------------------> Github-subdomains is loading 🌚️🌚️... [Hidden subdomains[Good]] 😘️😘️😘️:) <------------------------------";
   python3 [Your path/github-subdomains.py] -d $domain | anew subdomains.txt;
   printf "\n";
   echo "#### Github-subdomains is Ended ✅️✅️";
   printf "\n";
   echo "--------------------------------------------> Subfinder is loading 🌚️🌚️... [very good] 🥰️😘️🥰️:) <--------------------------------------------------";
   subfinder -d $domain | anew subdomains.txt;
   printf "\n";
   echo "#### Subfinder is Ended ✅️✅️";
   printf "\n";
   echo "--------------------------------------------> Amass is my favourite tool is loading 🌚️🔥️... [Great] 😍️💝️💝️🥰️:) <----------------------------------";
   amass enum -passive -d $domain | anew subdomains.txt;
   printf "\n";
   echo "#### Amass is Ended ✅️✅️";
   echo "--------------------------------------------> Gobuster for subdomain bruteforcing 🔥️🌚️🔥️... 😍️💝️💝️🥰️:) <----------------------------------";
   gobuster dns -d $domain -w commonsubdomains.txt -i;
   printf "\n";
   echo "#### gobuster is Ended ✅️✅️";
   printf "\n";
   printf "\n";
done;
   echo "-------------------------------------------------------> Start httpx 🙈️🙈️🔥️🔥️[alive subdomains] <----------------------------------------------------";
   httpx --status-code -list subdomains.txt | anew httpx.txt;
   printf "\n";
   echo "-------------------------------------------------------> Start Flutteration 🌔️🌔️🔥️ <----------------------------------------------------------";
   echo "-------------------------------------------------------> Remove 404 🌚️🌚️:( <----------------------------------------------------------------------";
   printf "\n";
   cat httpx.txt | grep -v "404" | cut -d " " -f1 | anew ALL-URLs.txt;
   printf "\n";
   echo "-------------------------------------------------------> Scan for subdomainTakeover using SubOver 💝️💝️:( <---------------------------------";
   printf "\n";
   cat httpx.txt | grep "404" | cut -d " " -f1 | anew 404.txt;
   SubOver -l 404.txt | anew takeover.txt;
   printf "\n";
   echo "#### Httpx and subdomain TakeOver is Ended ✅️✅️✅️✅️";
   printf "\n";
   echo "-------------------------------------------------------> Starting aquatone to collect screen shots Xlarge 📸️📸️🔥️ <------------------------------------------------";
   printf "\n";
   # cat ALL-URLs.txt | aquatone --ports large -chrome-path [path to your chromium]
   cat ALL-URLs.txt | aquatone --ports xlarge -chrome-path  [path to your chromium]
   printf "\n";
   echo "#### Aquatone is ended ✅️✅️✅️✅️";
   printf "\n";
   echo "-------------------------------------------------------> Using top 6 of nuclei scanner or all[default] 🔥️🔥️🔥️ <---------------------------------------------------";
   printf "\n";
   # cat ALL-URLs.txt | nuclei -t cves,exposed-panels,vulnerabilities,technologies,exposures,misconfiguration -o nuclei.txt;
   cat ALL-URLs.txt | nuclei -o nuclei.txt;
   printf "\n";
   echo "#### Nuclei scanner is ended ✅️✅️✅️✅️";
   printf "\n";
   echo "-------------------------------------------------------> Thanks :) made by @khaledyasse1882 🔥️🔥️🥰️🥰️ <--------------------------------------------------";
