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

echo
echo -e "${blue} =================================================== ${reset}"
echo
echo -e "${green}                          HEALTH CHECK ${reset}"
echo
echo -e "${blue} =================================================== ${reset}"
echo
echo "1.CPU Usage"
echo "2.Memory Usage"
echo "3.Disk Usage"
echo "4.System Uptime"
echo "5.Top 5 Memory Consuming Processes"
echo "6.Top 6 CPU Consuming Processes"
echo "7.Back to Main Menu"
read -p "Enter your Choice :" input
# we have used Case Operation Because we are displaying options for user
case $input in
1) 
echo
echo " CPU usage is "
top -bn1 | grep "Cpu(s)" ;;

2)
echo
echo -e "${blue} Memory Usage ${reset}:"
free -h;;

3)
echo
echo -e "${magentha} Disk usage : ${reset}"
df -h;;

4)
echo
echo -e "${cyan} System Uptime ${reset}"
uptime;;

5)
echo
echo -e "${yellow} Top 5 Memory Consuming Processes : ${reset}"
ps -eo pid,user,%mem,%cpu,comm --sort=-%mem | head -6 ;;

6)
echo
echo -e "${green} Top 5 CPU Consuming Processes : ${reset}"
ps -eo pid,user,%cpu,%mem,comm --sort=-%cpu | head -6 ;; #This Line prints the output in a order

7)
echo
echo "Returning to Main Menu"
./menu.sh ;;

*) # which decides whether the user input is between 1 -- 7, If User Chooses above or which is not equal to the provided options
echo "invalid Input";;

esac
