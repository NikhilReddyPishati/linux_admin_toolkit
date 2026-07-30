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

echo -e "${blue} ==================================================================== ${reset} "
echo
echo -e "${magentha}                       🪛 SERVICE MANAGEMENT ${reset}"
echo
echo -e "${blue} ==================================================================== ${reset} "
echo
echo "1.Check Service Status"
echo "2.Start a Service"
echo "3.Stop a Service"
echo "4.Restart a Service"
echo "5.Enable a Service"
echo "6.Disable a Service"
echo "7.Exit"
read -p "Enter Your Choice : " choice
echo
case $choice in
#Here Indentation Doesn't Matter But I I used It for Good Presentation
1)
echo
echo -e "${yellow} Checking Common Services :  ${reset}"
services=("cron" "ssh" "docker")
for service in "${services[@]}"
do
        if systemctl list-unit-files | grep -qw "$service.service" >/dev/null 2>&1 
        then
                if systemctl is-active --quiet "$service"
                then
                echo -e "${green}✅ $service is running"
                else
                echo -e "${green}❌ $service is installed${reset} ${red} but not running"
                fi
        else
        echo -e "${red} ❌ $service is not installed ${reset}"
        fi
done ;;

2)
echo
read -p "Enter the Service name in small letters To Start :" Service
if systemctl list-unit-files --type=service | grep -qw "$Service.service"
then
sudo systemctl start "$Service"
 if systemctl is-active --quiet "$Service"
 then
 echo -e "${green}✅ $Service started successfully"
 else
echo -e "${red} ❌ $Service Failed to start"
fi
else
echo -e "${red} ❌ $Service is not installed"
fi ;;

3) 
echo
read -p "Enter The Service name to be Stopped : " Service
if systemctl list-unit-files --type=service | grep "$Service.service"
then
sudo systemctl stop "$Service"  >/dev/null 2>&1
if systemctl is-active --quiet "$Service"
then
echo -e "${red}service is failed to stop${reset}"
else
echo -e "${green}service is stopped${reset}"
fi
else
echo "$Service is not installed"
fi;;

4)
echo
read -p "Enter the Service name in small letters To Restart :" Service
if systemctl list-unit-files --type=service | grep -qw "$Service.service"
then
sudo systemctl restart "$Service"  >/dev/null 2>&1
 if systemctl is-active --quiet "$Service"
 then
 echo -e "${green}✅ $Service restarted successfully"
 else
echo -e "${red} ❌ $Service Failed to start"
fi
else
echo -e "${red} ❌ $Service is not installed"
fi ;;

5) 
echo
read -p "Enter the Service name in small letters To Enable :" Service
if systemctl list-unit-files --type=service | grep -qw "$Service.service"
then
sudo systemctl enable "$Service"  >/dev/null 2>&1
 if systemctl is-enabled --quiet "$Service"
 then
 echo -e "${green}✅ $Service enabled successfully"
 else
echo -e "${red} ❌ $Service Failed to enabled"
fi
else
echo -e "${red} ❌ $Service is not installed"
fi ;;

6) 
echo
read -p "Enter the Service name in small letters To Disable 🧰 :" Service
if systemctl list-unit-files --type=service | grep -qw "$Service.service"
then
sudo systemctl disable "$Service"  >/dev/null 2>&1
 if systemctl is-enabled --quiet "$Service"
 then
 echo -e "${red} ❌ $Service Failed to disabled"
 else
echo -e "${green} ✅ $Service is Disabled successfully${reset}"
fi
else
echo -e "${red} ❌ $Service is not installed"
fi ;;

7) 
echo "Good Bye"
exit;;

*) echo "invalid Input";;
esac
