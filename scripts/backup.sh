#!/bin/bash
# colors
GREEN="\e[32m"
RED="\e[31m"
YELLOW="\e[33m"
BLUE="\e[34m"
RESET="\e[0m"

echo
echo "******************************************"
echo
echo    -e "${BLUE}     💾BACKUP MANAGER${RESET}"
echo
echo "******************************************"
read -p "Please enter your directory to Backup : " bck_file
bck_file="../projects/$bck_file"
if [ ! -d "$bck_file" ]
then
echo -e "${RED} sorry no directory found${RESET}"
exit 1
else
mkdir -p ../backups
backup_name="backup_$(date +%y%m%d_%H%M%S).tar.gz"
tar -czf "../backups/$backup_name" "$bck_file"
echo
echo -e "${GREEN} Backup Created${RESET}"
echo -e "${YELLOW} Backup file : $backup_name${RESET}"
echo "$(date '+%y%m%d_%H%M%S'): Backup created successfully,Backup FileName:$backup_name" >> ../logs/toolkit.log
read -p "If you want to see content of the file press only (y/n)" choice
if [ "$choice" == "y" ]
then
echo
tar -tf "../backups/$backup_name"
else
echo "exiting"
fi
fi
