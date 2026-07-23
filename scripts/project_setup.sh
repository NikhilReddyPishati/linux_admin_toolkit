#!/bin/bash
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
echo "Project Already Exists"
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
echo "Project Named '$project_name' Is Successfully Created with its Related Files"
echo "$(date) : Project '$project_name' is created successfully.">> ../logs/toolkit.log
echo "Do You Want to enter into project $project_name (y/n)"
read input
if [ "$input" == "y" ] || [ "$input" == "Y" ];
then
cd "../projects/$project_name" && exec bash
elif [ "$input" == "n" ] || [ "$input" == "N" ];
then
echo "Exiting"
else
echo "Invalid Input"
fi
read -p "Press Enter to return to Main Menu...."
