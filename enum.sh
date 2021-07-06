

#!/bin/bash

RED="\e[31m"
ENDCOLOR="\e[0m"

########credit############3
bash -c clear

echo "${RED}                                this tool is made by HWKDS ${ENDCOLOR}"

sleep 3


######clearing previous files######
bash -c clear
bash -c 'rm -rf nmap.list && rm -rf nresult.txt && rm -rf nikto.txt && rm -rf gobuster.txt'

###### user input###########
read -p "IP: " IPvar
echo  $IPvar >>nmap.list
bash -c clear

#### nmap ########
echo "${RED}Running Nmap on target ${ENDCOLOR}"
bash -c '/usr/bin/nmap -sC -sV -p- -iL nmap.list -o nresult.txt' 
echo "${RED}Your result is stored in nresult.txt ${ENDCOLOR}"
bash -c 'rm -rf nmap.list'


sleep 1

echo 'x-x-x-x-x-x-x-x-x-x-x-x-x-x'
sleep 1

######### nikto ############
echo  "${RED}Running nikto on target ${ENDCOLOR}"
sleep 1

bash -c "nikto -host $IPvar -o nikto.txt"
echo "${RED}Your result is stored in nikto.txt ${ENDCOLOR}"
sleep 1

echo 'x-x-x-x-x-x-x-x-x-x-x-x-x-x'
sleep 1

######### gobuster ##########

echo  "${RED}Running gobuster on target ${ENDCOLOR}"
bash -c "gobuster dir --url http://$IPvar -w /usr/share/wordlists/dirb/common.txt -o gobuster.txt"
echo "${RED}Your result is stored in gobuster.txt ${ENDCOLOR}"

