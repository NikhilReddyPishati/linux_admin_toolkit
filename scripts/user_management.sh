#!/bin/bash

green="\e[32m"    #This belongs to green color which is used to dispaly the content in color
red="\e[31m"      #This belongs to red color which is used to display the content in color
yellow="\e[33m"   #This belongs to yellow color which is used to diplay the content in color
blue="\e[34m"     #This belongs to blue color which is used to dispaly the content in color
magentha="\e[35m" #This belongs to magentha color which is used to display the content in color
cyan="\e[36m"     #This belongs to cyan color which is used to display the content in color
white="\E[37m"    #This belongs to White color which is used to display the content in color
black="\E[30m"    #This belongs to  Black color which is used to display the content in color
reset="\e[0m"     #This is used to reset the color which is used for displaying the content

echo -e "${yellow} *****************************************${reset}"
echo
echo -e "${magentha}        👤 USER MANAGEMENT  ${reset}           "
echo
echo -e "${yellow} *****************************************${reset}"
echo -e "${cyan} Please Choose Any One Option ${reset}"
#This is an option where it depends on the user input
echo "1. User Information"
 #if user press this option total info of user get displayed
echo "2. Add User" 
# This Option helps user to add another user if user enters password correctly
echo "3. Delete User" 
# This Helps useer to delete the user if user enter passwor dcorrectly
echo "4. Change password" 
# This Helps the user to change the password of the current logged in user
echo "5. Lock User"  
# This just stop the user to login to the locked account
echo "6. Unlock User" 
#This is an option which unlocks the user
echo "7. List all the users "
#This option helps the user to list all users
echo "8. Exit"
#This option helps the user to Exit from the Main menu
read -p "Enter Your Choice :" choice
#This takes input from user and sends to the case statement

case $choice in

1)
echo -e "$yellow} ##################################################${reset}" #This Line Prints in yellow color because we have created variable named yellow according to the value
echo
echo -e "${magentha}        👤 USER INFORMATION  ${reset}           "
echo
echo -e "${yellow}##################################################${reset}"
echo
echo -e "${white} Current logged-in User :${reset}" $(whoami)
#Displays current user Name
echo
echo -e "${green} User Details :${reset}" $(id)
#Displays User id ect...
echo
echo -e "${red} All Logged-in Users :${reset}" $(uname -a)
# Displays All current logged in Users
echo
echo -e "${blue} Host : ${reset}" $(hostname)
# Displays Only Hostname 
echo
echo " Home Directory :" $HOME
#Displays Directory Name
echo
echo " User Groups :" $(groups)
# Displays groups if any
echo
echo " Sudo Access :"
if groups | grep -qw "sudo"
then
echo -e "${green} User Has Sudo Access ${reset}"
else
echo -e "${red} Sorry No Sudo Access ${reset}"
fi
echo
echo -e " ${magentha} Current Shell :${reset}" $SHELL
echo -e "${yellow}##################################################${reset}"
echo
echo -e "${green}             👤 USER INFORMATION ENDED    ${reset}"
echo
echo -e "${yellow} ##################################################${reset}"
;;

2)
echo
echo "Please Enter User Name" 
read Name
if id "$Name" >/dev/null 2>&1
# >/dev/null 2>&1 Does Not print any extra output errors just nothing
then
echo -e "${red} $Name already Existed $(reset)"
else
sudo useradd -m "$Name"
if id "$Name" >/dev/null 2>&1
then
echo
echo "set Password for : $Name"
sudo passwd "$Name"
echo -e "${green} User named $Name is Created successfully${reset}"
echo "$(date) user "$Name" is created Successfully " >> ../logs/toolkit.log #it stores in Logs Files
else
echo -e "${red} Failed to create user${reset}"
fi
fi
echo
echo "You want to see all users (y/n)"
read input
if [ "$input" = "y" ] || [ "$input" = "Y" ]
then
echo "$(cut -d: -f1 /etc/passwd) "
elif [ "$input" = "n" ] || [ "$input" = "N" ]
then
exit 1
else
echo "invalid Input"
fi
echo 
;;

3)
echo "Please enter username to be Deleted"
read Name
if id "$Name" >/dev/null 2>&1
then
sudo userdel -r "$Name" >/dev/null 2>&1
if id "$Name" >/dev/null 2>&1
then
echo "Failed to delete User $Name"
else
echo -e "${green} $Name Is Deleted Successfully ${reset}"
echo "$(date) user " $Name" is deleted Successfully " >> ../logs/toolkit.log
fi
else
echo -e "${red} $Name Doesnot Exist ${reset}"
fi
read -p " You want to see all users (y/n) " input
if [ "$input" = "y" ] || [ "$input" = "Y" ]
then
cut -d: -f1 /etc/passwd
elif [ "$input" = "n" ] || [ "$input" = "N" ] >/dev/null 2>&1
then
echo "Exiting"
exit
else
echo "Invalid Input"
fi
echo
;;

4)
echo
echo -e "${yellow} Please enter user name : "
read Name
if id "$Name" >/dev/null 2>&1
then
sudo passwd "$Name"
if [ $? -eq 0 ]
then
echo -e "${green} Password Changed Successfully ${reset} "
echo "$(date) user " $Name" password changed Successfully " >> ../logs/toolkit.log
else
echo -e "${red} Unable to change Password ${reset} "
fi
else
echo -e "${red} $Name not found ${reset} "
fi
 ;;

5)
echo
echo "Enter User Name : "
read Name
if id "$Name" >/dev/null 2&>1
then
sudo passwd -l "$Name" >/dev/null 2>&1
if [ $? -eq 0 ]
then
echo " $Name locked Successfully "
else
echo "Unable to lock $Name "
fi
else
echo "no user found"
fi
;;

6)  
echo
echo "Enter User Name : "
read Name
if id "$Name" >/dev/null 2&>1
then
sudo passwd -u "$Name" >/dev/null 2>&1
if [ $? -eq 0 ]
then
echo " $Name unlocked Successfully "
else
echo "Unable to unlock $Name "
fi
else
echo "no user found"
fi
 ;;

7)
echo 
echo -e "${blue} =================================================== ${reset}"
echo
echo -e "${yellow}               LISTING ALL USERS ${reset}"
echo
echo -e "${blue} =================================================== ${reset}"
cut -d: -f1 /etc/passwd
# it prints every users where it stored in password files
echo
echo -e "${blue} =================================================== ${reset}"
read -p "press Enter to Return to Main Menu .."
./menu.sh
;;

8)
echo "Good Bye"
exit 1 
#This Option Exit from the Main menu and Displays GoodBye
;;

*) echo "invalid Input ";;
esac #end case statements
