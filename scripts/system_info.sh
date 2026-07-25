#!/bin/bash

echo "********************************************"
echo 
echo "           SYSTEM INFORMATION               "
echo 
echo "********************************************"
host_name=$(hostname)
date=$(date)
echo "Hostname               : $host_name"
echo "Current user           : $USER"
echo "Home Directory         : $HOME"
echo "Current Directory      : $PWD"
echo "Current Date           : $date"
echo "kernel version         : $(uname -r)"
echo "system Uptime          : $(uptime -p)"
echo "IP Address             : $(hostname -I)"
echo "*****************************************"
echo "             MEMORY USAGE :               "
echo "***************************************"
free -h

echo "***************************************"
echo :"            DISK USAGE : "
echo "***************************************"
df -h
