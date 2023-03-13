#!/bin/bash
for (( a = 1; a < 3; a++ ))
do
echo "HOSTNAME = $(hostname)" 
echo "TIMEZONE = $(timedatectl | grep "Time zone")" 
echo "USER = $(whoami)"
echo "OS = $(cat /etc/issue)"
echo "DATE = $(date)"
echo "UPTIME = $(uptime -p)"
echo "UPTIME_SEC = $(awk '{print $1}' /proc/uptime)"
echo "IP = $(ip a | grep 'inet ')"
echo "MASK = $( /sbin/ifconfig | grep 'netmask')"
echo "GATEWAY = $(ip -4 route show default)"
echo "RAM_TOTAL = $(grep MemTotal /proc/meminfo)"
echo "RAM_USED = $(vmstat -s | grep 'used m')"
echo "RAM_FREE = $(grep MemFree /proc/meminfo)"
echo -e "SPACE_ROOT = \n $(df -hT | grep '/$\|Filesystem')"
if [ $a -eq 2 ]; then
    exec 1>&7 7>&- 
    exit 1
fi
echo "Writing the data to a file (answer Y/N)."
read ask
if [ $ask = 'y' ] || [ $ask = 'Y' ]; then
    dateNum=$( date +"%d_%m_%g_%H_%M_%S" )
    myfile=$dateNum'.txt'
    exec 7>&1
    exec >> $myfile
else
    echo "Answer No, goodbay)."
    exit 1
fi
done 


