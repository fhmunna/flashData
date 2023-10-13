
# Scan against IP or host
nmap 1.1.1.1
# scan a hostname
nmap cloudflare.com
# Ping Scan
nmap -sp 192.168.5.0/24
# Scan multiple IP addresses
nmap 1.1.1.1 8.8.8.8
# scan consecutive IP addresses
nmap 1.1.1.1,2,3,4
# Scan IP ranges
nmap 8.8.8.0/28
nmap 8.8.8.1-14
nmap 8.8.8.*



# exclude certain IPs from the IP range scan
nmap -p 8.8.8.* --exclude 8.8.8.1


# port scan
nmap -p 80 X.X.X.X

# Scan specific ports or scan entire port ranges
nmap -p 1-65535 localhost
nmap -p 80,443 8.8.8.8


# Scan the most popular (20) ports
nmap --top-ports 20 192.168.1.106
# Scan 100 most common ports (Fast)
nmap -F 192.168.1.1
# Scan all 65535 ports	
nmap -p- 192.168.1.1

# Nmap Port Scan types
# Scan using TCP connect
nmap -sT 192.168.1.1
# Scan using TCP SYN scan (default)
nmap -sS 192.168.1.1
# Scan UDP ports
nmap -sU -p 123,161,162 192.168.1.1
# Scan selected ports - no PING
nmap -Pn -F 192.168.1.1
# Scan hosts and IP addresses reading from a text file
nmap -iL list.txt



# Disabling DNS name resolution
nmap -p 80 -n 8.8.8.8
# See the difference with a normal DNS-resolution enabled scan:
nmap -p 80 8.8.8.8




# Scan + OS and service detection with fast execution
nmap -A 192.168.1.1
nmap -A -T4 cloudflare.com
 # Detect service/daemon versions
nmap -sV localhost
nmap -sV 192.168.1.1
# More aggressive Service Detection
nmap -sV --version-intensity 5 192.168.1.1
# Lighter banner grabbing detection
nmap -sV --version-intensity 0 192.168.1.1




# Scan using TCP or UDP protocols
# Standard TCP scanning:
nmap -sT 192.168.1.1
# UDP scanning
nmap -sU localhost



# Anomaly Detection 
# CVE detection using Nmap
nmap -Pn --script vuln 192.168.1.105
# infections Scanning
nmap -sV --script=http-malware-host 192.168.1.105
# infections Scanning using Google’s Malware check:
nmap -p80 --script http-google-malware infectedsite.com
# Concurrent Scanning-BrutForce
nmap -sV --script http-wordpress-brute --script-args 'userdb=users.txt,passdb=passwds.txt,http-wordpress-brute.hostname=domain.com, http-wordpress-brute.threads=3,brute.firstonly=true' 192.168.1.105
# Concurrent Scanning-DDOS
nmap 192.168.1.105 -max-parallelism 800 -Pn --script http-slowloris --script-args http-slowloris.runforever=true
# Concurrent Scanning-MYSQL-Injection
nmap -p 1433 --script ms-sql-brute --script-args userdb=customuser.txt,passdb=custompass.txt 192.168.1.105
# Concurrent Scanning-FTP
nmap --script ftp-brute -p 21 192.168.1.105

# A scan to search for DDOS reflection UDP services
# Scan for UDP DDOS reflectors	
nmap –sU –A –PN –n –pU:19,53,123,161 –script=ntp-monlist,dns-recursion,snmp-sysdescr 192.168.1.0/24

# Detect Heartbleed SSL Vulnerability
Heartbleed Testing	nmap -sV -p 443 --script=ssl-heartbleed 192.168.1.0/24







# HTTP Service Information
# Gather page titles from HTTP services	
nmap --script=http-title 192.168.1.0/24
# Get HTTP headers of web services	
nmap --script=http-headers 192.168.1.0/24
# Find web apps from known paths	
nmap --script=http-enum 192.168.1.0/24



# IP Address information
# Find Information about IP address	
nmap --script=asn-query,whois,ip-geolocation-maxmind 192.168.1.0/24


# Save your Nmap scan results to a file
nmap -oN output.txt securitytrails.com
nmap -oX output.xml securitytrails.com
# Save default output to file	
nmap -oN outputfile.txt 192.168.1.1
# Save results as XML	
nmap -oX outputfile.xml 192.168.1.1
# Save results in a format for grep	
nmap -oG outputfile.txt 192.168.1.1
# Save in all formats	
nmap -oA outputfile 192.168.1.1

# Nmap XML to CSV script 	
github.com/hackertarget/nmap-csv-xlsx



# Digging deeper with NSE Scripts
# Scan using default safe scripts	
nmap -sV -sC 192.168.1.1
# Get help for a script	
nmap --script-help=ssl-heartbleed
# Scan using a specific NSE script	
nmap -sV -p 443 –script=ssl-heartbleed.nse 192.168.1.1
# Scan with a set of scripts	
nmap -sV --script=smb* 192.168.1.1
# Search for NSE scripts - command line	
locate *.nse



# Refferences:
# https://securitytrails.com/blog/nmap-commands
# https://nmap.org/docs.html
# https://nmap.org/book/toc.html
# https://hackertarget.com/nmap-cheatsheet-a-quick-reference-guide/
# https://hackertarget.com/nmap-tutorial/
# https://hackertarget.com/7-nmap-nse-scripts-recon/
# https://www.mygreatlearning.com/blog/nmap-commands/