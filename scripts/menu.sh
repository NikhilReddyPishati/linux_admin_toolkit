#!/bin/bash
RED="\e[31m"
RESET="\e[0m"
while true
do
echo "****************************************************************"
echo "  "
echo "                LINUX ADMINISTRATION TOOLKIT                         "
echo "  "
echo "****************************************************************"
echo
echo " Please Enter Your Choice from 1---9 "
echo
echo "1. 💻 System Information"
echo "2. 🎦 Project.setup"
echo "3. 🔙 Backup Manager"
echo "4. 👤 User Management"
echo "5. 💾 Disk Monitor"
echo "6. 🧠 Memory Monitor"
echo "7. 🔨 Service Manager"
echo "8. ❤️‍❤️ Health Check"
echo "9. 👋 Exit"
read -p " Enter your choice :  " choice
case $choice in
1)./system_info.sh;;
2)./project_setup.sh;;
3)./backup.sh;;
4)./user_management.sh;;
5)./disk_monitor.sh;;
6)./memory_monitor.sh;;
7)./service_manager.sh;;
8)./health_check.sh;;
9)echo -e "${RED} Thank you for using Linux Administration toolkit";;
*)echo "invalid Input"
esac
if [ $choice -eq 9 ]
then
break
fi
echo
read -p"Please Enter to Continue......"
clear
done

