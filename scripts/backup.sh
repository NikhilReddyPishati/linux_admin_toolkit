#!/bin/bash
# colors
green="\e[32m"
red="\e[31m"
yellow="\e[33m"
blue="\e[34m"
reset="\e[0m"

echo
echo "******************************************"
echo
echo    -e "${blue}     💾BACKUP MANAGER${reset}"
echo
echo "******************************************"
read -p "Please enter your directory to Backup : " bck_file
bck_file="../projects/$bck_file"
if [ ! -d "$bck_file" ]
then
echo -e "${red} sorry no directory found${reset}"
exit 1
else
mkdir -p ../backups
backup_name="backup_$(date +%y%m%d_%H%M%S).tar.gz"
tar -czf "../backups/$backup_name" "$bck_file"
echo
echo -e "${green} Backup Created${reset}"
echo -e "${yellow} Backup file : $backup_name${reset}"
echo "$(date '+%y%m%d_%H%M%S'): Backup created successfully,Backup FileName:$backup_name" >> ../logs/toolkit.log
read -p "If you want to see content of the file press only (y/n)" choice
if [ "$choice" = "y" ] |[ "$choice" = "Y" ] 
then
echo
tar -tf "../backups/$backup_name"
else
echo "exiting"
fi
fi
