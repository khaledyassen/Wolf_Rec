# 🐺️🐺️ Wolf_Rec 🐺️🐺️

### It is a script written in bash for subdomain enumeration, Nmap scanning, gathering endpoints, and other attacks.

# 💿️ Installation 💿️ 

## Requirements 

#### Require the `go` language in your machine Then

```
git clone https://github.com/khaledyassen/Wolf_Rec.git
cd Wolf_Rec
sudo chmod +x *.sh
./install.sh
```

# Usage 🎯

##### 1] Subdomains Enumeration.

##### 2] Subdomain brute forcing for small list You can add your own list.

##### 3] Scanning for subdomain takeover.

##### 4] Enumerate public resources in AWS, Azure, and Google Cloud using cloud_enum.

##### 5] Gathering Endpoints using gau and katana for crawling.

##### 6] Gathering hidden parameters using param spider. 

##### 7] Port scanning using Nmap scanner.

##### 8] Scanning for known CVEs using jaeles.

##### 9] Vulnerability scanner using Zaproxy by `ZapScan.sh` file.

##### 10] LFI, SQLI, XSS, SSRF, SSTI, CRLF, Smuggler, header, and command injection using the `Injector.sh` file.  

# How to use it 🐺️

#### Add the domains of your target in `scope.txt` file whatever the number of domains and leave the script to do the reset 🐺️
```
./Wolf_Rec.sh
```

#### For parameter injection for different vulnerabilities using the most popular tool run the following file.
```
./Injector.sh 
```

#### If you want to use the Zap proxy vulnerability scanner run the following file.
```
./ZapScan.sh 
```
