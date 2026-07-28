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

echo "******************************************"
echo
echo "            PROJECT SETUP                 "
echo
echo "******************************************"
echo
read -p "Enter Your Project Name :" project_name
if [ -d "../projects/$project_name" ]
# -d verifies whether there is a directory exists or not
then
echo -e "${red} Project Already Exists ${reset}"
exit 1
else
#it creates all the required files and Directories
mkdir "../projects/$project_name"
mkdir "../projects/$project_name/src"
mkdir "../projects/$project_name/docs"
mkdir "../projects/$project_name/logs"
mkdir "../projects/$project_name/config"
touch "../projects/$project_name/README.md"
fi
#we can also create these files using advanced features of Linux Like Directly ::: mkdir "../Projects/Project_name/{src,docs,logs,config}
echo
echo -e "${green} Project Named '$project_name' Is Successfully Created with its Related Files ${reset}"
echo "$(date) : Project '$project_name' is created successfully.">> ../logs/toolkit.log
echo -e "${magentha} Do You Want to enter into project $project_name (y/n) ${reset}"
read input
if [ "$input" == "y" ] || [ "$input" == "Y" ];
then
cd "../projects/$project_name" && exec bash
#  launches a new shell it tells the script to open a new nested shell inside the target directory
elif [ "$input" == "n" ] || [ "$input" == "N" ];
then
echo -e "${cyan}Exiting ${reset}"
else
echo -e "${red} Invalid Input ${reset}"
fi
read -p "Press Enter to return to Main Menu...."
