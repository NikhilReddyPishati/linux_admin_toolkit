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

echo -e "${magentha} =============================================================================================================== ${reset}"
echo
echo -e "${cyan}                                            💾 DISK MONITORING     ${reset}"
echo
echo -e "${magentha} =============================================================================================================== ${reset}"
echo
echo -e "${cyan}                                              Total Disk Used   ${reset}"
echo "$(df -h)" #we used $ because we need to print disk used storage
echo
echo -e "${yellow} Project size ${reset}" $(du -sh)
echo
echo -e "${cyan}                                             Connected Storage Devices      ${reset}"
echo "$(lsblk)"
echo
echo -e "${cyan}                                  List of Top 10 Storage Consuming Directories     ${reset}"
du -h "$HOME" 2>/dev/null | sort -hr | head -10
echo
echo -e "${red}                                         Top 10 Files Which Consume Storage   ${reset}"
echo
find "$HOME" -type f -exec ls -lh {} + 2>/dev/null | sort -k5 -hr | head -10
# $HOME -it selects and searches in Home directory
# -type f - lists only files
# -exec ls -lh {} - provides every permissions of searched files
# +2>/dev/null - hide permissions denied messages
# sort -k5 -hr  - sorts the order -h is for human understandable way and r is for reversed sorted order
# head -10 - just prints top 10 files
echo
echo -e "${cyan}                                                     DISK HEALTH CHECK ${reset}"
usage=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')
#df -h - gives total filesystem details
#awk NR==2 {print 5} Takes to 5th column
# tr -d % removes % marks

if [ "$usage" -ge 80 ]
then
echo -e "${red} ⚠️Warning: Disk usage is ${usage}%${reset}"
else
echo -e "${green}💚 Disk usage is healthy (${usage}%).${reset}"
fi
echo
echo -e "${magentha} =============================================================================================================== ${reset}"
echo
echo -e "${cyan}                                                  💾 DISK MONITORING ENDED    ${reset}"
echo
echo -e "${magentha} =============================================================================================================== ${reset}"
read -p "Press Enter to Exit"
exit 1

