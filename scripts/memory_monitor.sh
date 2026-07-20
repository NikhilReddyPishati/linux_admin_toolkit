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
echo -e "${blue} =====================================================================================${reset}"
echo
echo -e "${magentha}                             🧠 MEMORY MONITORING   ${reset}"
echo -e "${blue} =====================================================================================${reset}"
echo
echo -e "${magentha}                                  Memory Usage          ${reset}"
echo
free -h
total=$(free | awk '/Mem:/ {print $2}')
#awk '/Mem:/ {print $2} looks for the line that starts with Mem:
#prints 2nd column
used=$(free | awk '/Mem:/ {print $3}')
#prints 3 column
usage=$(( used * 100 / total ))
# it calculates (used * 100) divides total
echo
echo -e "${green} Memory Usage : ${usage}%${reset}"
echo
if [ "$usage" -le 50 ]
then
echo -e "${blue} Status : Memory Usage Is low ${reset}"
elif [ "$usage" -lt 80 ]
then
echo -e "${blue} Status : Memory usage Is Medium ${reset}"
else
echo "${blue} Status : Memory Usage Is High ${reset}"
fi
echo
echo "Top 5 Memory Usage Processes"
ps -eo pid,comm,%mem --sort=-%mem | head -6
echo
# ps displays all processes
# -e shows current running processes
# o pid,comm,%mem displays process id,command name,memory usage percentage
# --sort=-mem sort processes from highest memory usage to lowest
# head -6 filters top 5 processes 1 header row
echo -e "${blue}system uptime : ${reset}" $(uptime)
echo
echo -e "${blue} Memory Information {reset}"
cat /proc/meminfo | head -10
#/proc/meminfo - its a virtual file created by linux kernel.it doesn't exist on disk on disk like a normal file
# - it shows the current memory information whenever you need
echo
echo -e "${blue} =====================================================================================${reset}"
echo
echo -e "${magentha}                             🧠 MEMORY MONITORING ENDED  ${reset}"
echo -e "${blue} =====================================================================================${reset}"
echo
