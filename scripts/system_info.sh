#!/bin/bash
green="\e[32m"
red="\e[31m"
yellow="\e[33m"
blue="\e[34m"
magentha="\e[35m"
cyan="\e[36m"
white="\E[37m"
black="\E[30m"
reset="\e[0m"

echo "********************************************"
echo 
echo -e "${yellow}           SYSTEM INFORMATION       ${reset}        "
echo 
echo "********************************************"
host_name=$(hostname)
date=$(date)
echo -e "${blue}Hostname               : $host_name ${reset}"
echo -e "${magentha} Current user           : $USER ${reset}"
echo -e "${cyan} Home Directory         : $HOME ${reset}"
echo -e "${yellow} Current Directory      : $PWD ${reset}"
echo -e "${green}Current Date           : $date ${reset}"
echo -e "${red} kernel version         : $(uname -r) ${reset}"
echo -e "${white} system Uptime          : $(uptime -p) ${reset}"
echo -e "${green} IP Address             : $(hostname -I) {reset}"
echo "*****************************************"
echo -e "${green}             MEMORY USAGE ${reset}:               "
echo "***************************************"
free -h

echo "***************************************"
echo -e "${green}           DISK USAGE : ${reset}"
echo "***************************************"
df -h
