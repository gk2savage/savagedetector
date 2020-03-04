#! /bin/bash

# ======================================================================
# SCRIPT NAME:  

# PURPOSE: Info Gathering and Vulnerability Scanner

# REVISION HISTORY:

# AUTHOR	 	DATE		DETAILS
# --------------------- --------------- --------------------------------
# Girish Kumar          01/02/2020	Initial version
# aka gk2savage

# Find me on all Social media by @gk2savage
# LICENSE: 
# ======================================================================



echo "------------------------------------------------------------------------------------------------------"


echo -e  "\e[1;36m                          
   _____    __      __     _____ ______   _____  ______ _______ ______ _____ _______ ____  _____  
  / ____|  /\ \    / /\   / ____|  ____| |  __ \|  ____|__   __|  ____/ ____|__   __/ __ \|  __ \ 
 | (___   /  \ \  / /  \ | |  __| |__    | |  | | |__     | |  | |__ | |       | | | |  | | |__) |
  \___ \ / /\ \ \/ / /\ \| | |_ |  __|   | |  | |  __|    | |  |  __|| |       | | | |  | |  _  / 
  ____) / ____ \  / ____ \ |__| | |____  | |__| | |____   | |  | |___| |____   | | | |__| | | \ \ 
 |_____/_/    \_\/_/    \_\_____|______| |_____/|______|  |_|  |______\_____|  |_|  \____/|_|  \_\        
 \e[0m"




echo -e "\e[1;31m\e[1;42m Integrated Vulnerability Detection Framework\e[0m                                  -version 0.01 beta \e[0m"
echo "------------------------------------------------------------------------------------------------------"
echo -e "\e[1;33m                                                                                CREATED BY : @gk2savage  \e[0m"


echo -e  "\e[1;32m                          
░▐█▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█▄☆
░███████████████████████
░▓▓▓▓▓▓▓▓▓▓▓▓██▓▓▓▓▓▓▓▓◤
╬▀░▐▓▓▓▓▓▓▌▀█░░░█▀░
▒░░▓▓▓▓▓▓█▄▄▄▄▄█▀╬░
░░█▓▓▓▓▓▌░▒▒▒▒▒▒▒▒▒
░▐█▓▓▓▓▓░░▒▒▒▒▒▒▒▒▒
░▐██████▌╬░▒▒▒▒▒▒▒▒

 \e[0m"


echo -e "\e[1;34mStarting to run the script...\e[0m"

spinner() {
    local i sp n
    sp='◷ ◶ ◵ ◴'
    n=${#sp}
    printf ' '
    while sleep 0.05; do
        printf "%s\b" "${sp:i++%n:1}"
    done
}

printf 'setting up weapons '
spinner &

sleep 4  # sleeping for 10 seconds is important work

kill "$!" # kill the spinner
printf '\n'




# VARIABLE ASSIGNMENT
# Show hostname:
HOST=$(hostname)
# User executing the script:
CURRENTUSER=$(whoami)
# Current date:
CURRENTDATE=$(date +%F)
# Host IP address:
IPADDRESS=$(hostname -I | cut -d ' ' -f1)

# SHOW MESSAGES
echo "Today is $CURRENTDATE"
echo "Hostname: $HOST ($IPADDRESS)"

sleep 1

echo "Enter IP Address:"
read iptarget


if [[ $iptarget =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "Valid IP Address"
else
  echo "Invalid IP Address. Quitting..."
  exit
fi


#INFINITE LOOP
for (( ; ; ))
do
{
#STARTING

echo -e "\e[1;33m [0]  Ping Scan (Check Whether Host is Up)\e[0m"
echo -e "\e[1;33m [1]  Simple Port Scan \e[0m"
echo -e "\e[1;33m [2]  Stealth Port Scan \e[0m"
echo -e "\e[1;31m [3]  Aggressive Port Scan with Version Detection\e[0m"
echo -e "\e[1;33m [4]  Whois Lookup \e[0m"
echo -e "\e[1;33m [5]  DNS Enumeration (MX and NS) \e[0m"
echo -e "\e[1;33m [6]  Nslookup \e[0m"
echo -e "\e[1;37m [7]  Subnet Calculator \e[0m"
echo -e "\e[1;31m [8]  Check Directories and Subdomains (Dirb)(write 8 for http and 8s for https) \e[0m"
echo -e "\e[1;31m [9]  Nikto Tool\e[0m"
echo -e "\e[1;31m [10] SQLMAP (Check for Sql Injection Vulnerabilities)\e[0m"
echo -e "\e[1;36m [f]  Fix Missing Files and Install Required Tools \e[0m"
echo -e "\e[1;35m [x]  EXIT \e[0m"
echo "-"
echo -e "\e[1;37m Yellow [] are safe to use, while Red [] should be done only if you have permission, because these scans might be illegal in your Country \e[0m"
echo "-"

echo "Enter Option:"
read option

if [ "$option" = 0 ];
then
    nmap -sn $iptarget
fi

if [ "$option" = 1 ];
then
    nmap $iptarget
fi

if [ "$option" = 2 ];
then
    nmap -sS $iptarget
fi

if [ "$option" = 3 ];
then
    nmap -A -sV $iptarget   
fi

if [ "$option" = 4 ];
then
       whois $iptarget
fi

if [ "$option" = 5 ];
then
     echo "NS"
     host -t ns google.com
     echo "MX"  
     host -t mx google.com
fi

if [ "$option" = 6 ];
then
     nslookup $iptarget  
fi

if [ "$option" = 7 ];
then
     ipcalc $iptarget  
fi

if [ "$option" = 8 ];
then
     dirb http://$iptarget
 
fi

if [ "$option" = "8s" ];
then
     dirb https://$iptarget
 
fi

if [ "$option" = 9 ];
then
     nikto -host $iptarget
 
fi

if [ "$option" = 10 ];
then
     sqlmap $iptarget
 
fi

if [ "$option" = "f" ];
then
     apt-get install -y nmap
     apt-get install -y nslookup
     apt-get install -y whois
     apt-get install -y ipcalc
     apt-get install -y nikto 
     apt-get install -y dirb  
     apt-get install -y sqlmap  
     echo "Done"
     break  
fi

if [ "$option" = "x" ];
then
     echo "Quitting"
     break  
fi

echo "-------------------------------------------------------------------"
read -n 1 -s -r -p "Press any key to continue..."
clear


#Design REPRINT
############################################
echo "------------------------------------------------------------------------------------------------------"


echo -e  "\e[1;36m                          
   _____    __      __     _____ ______   _____  ______ _______ ______ _____ _______ ____  _____  
  / ____|  /\ \    / /\   / ____|  ____| |  __ \|  ____|__   __|  ____/ ____|__   __/ __ \|  __ \ 
 | (___   /  \ \  / /  \ | |  __| |__    | |  | | |__     | |  | |__ | |       | | | |  | | |__) |
  \___ \ / /\ \ \/ / /\ \| | |_ |  __|   | |  | |  __|    | |  |  __|| |       | | | |  | |  _  / 
  ____) / ____ \  / ____ \ |__| | |____  | |__| | |____   | |  | |___| |____   | | | |__| | | \ \ 
 |_____/_/    \_\/_/    \_\_____|______| |_____/|______|  |_|  |______\_____|  |_|  \____/|_|  \_\        
 \e[0m"




echo -e "\e[1;31m\e[1;42m Integrated Vulnerability Detection Framework\e[0m                                  -version 0.01 beta \e[0m"
echo "------------------------------------------------------------------------------------------------------"
echo -e "\e[1;33m                                                                                CREATED BY : @gk2savage  \e[0m"


echo -e  "\e[1;32m                          
░▐█▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█▄☆
░███████████████████████
░▓▓▓▓▓▓▓▓▓▓▓▓██▓▓▓▓▓▓▓▓◤
╬▀░▐▓▓▓▓▓▓▌▀█░░░█▀░
▒░░▓▓▓▓▓▓█▄▄▄▄▄█▀╬░
░░█▓▓▓▓▓▌░▒▒▒▒▒▒▒▒▒
░▐█▓▓▓▓▓░░▒▒▒▒▒▒▒▒▒
░▐██████▌╬░▒▒▒▒▒▒▒▒

 \e[0m"



############################################

#ENDING
}
done
#INFINITE LOOP



