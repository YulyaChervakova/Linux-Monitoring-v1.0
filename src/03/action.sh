#!/bin/bash
NORMAL='\033[0m'
column1_background=6
column1_font_color=1
column2_background=6
column2_font_color=1
i=1;
for color in "$@" 
do
case "$i" in
1) column1_background=$color ;;
2) column1_font_color=$color ;;
3) column2_background=$color ;;
4) column2_font_color=$color ;;
esac
i=$((i + 1));
done

dirName=$(dirname $0)
# Check color
. ${dirName}/colorChecking.sh column1_background column1_font_color column2_background column2_font_color
# Cheng Color back
. ${dirName}/colorBackground.sh $column1_background 
column1_background=$color
. ${dirName}/colorBackground.sh $column2_background 
column2_background=$color
. ${dirName}/colorFont.sh $column1_font_color
column1_font_color=$color
. ${dirName}/colorFont.sh $column2_font_color
column2_font_color=$color
echo -e "${column1_font_color}${column1_background}HOSTNAME${NORMAL} = ${column2_background}${column2_font_color}$(hostname)${NORMAL}" 
echo -e "${column1_background}${column1_font_color}TIMEZONE${NORMAL} = ${column2_background}${column2_font_color}$(timedatectl | grep "Time zone")${NORMAL}" 
echo -e "${column1_background}${column1_font_color}USER${NORMAL} = ${column2_background}${column2_font_color}$(whoami)${NORMAL}"
echo -e "${column1_background}${column1_font_color}OS${NORMAL} = ${column2_background}${column2_font_color}$(cat /etc/issue)${NORMAL}"
echo -e "${column1_background}${column1_font_color}DATE${NORMAL} = ${column2_background}${column2_font_color}$(date)${NORMAL}"
echo -e "${column1_background}${column1_font_color}UPTIME${NORMAL} = ${column2_background}${column2_font_color}$(uptime -p)${NORMAL}"
echo -e "${column1_background}${column1_font_color}UPTIME_SEC${NORMAL} = ${column2_background}${column2_font_color}$(awk '{print $1}' /proc/uptime)${NORMAL}"
echo -e "${column1_background}${column1_font_color}IP${NORMAL} = ${column2_background}${column2_font_color}$(ip a | grep 'inet ')${NORMAL}"
echo -e "${column1_background}${column1_font_color}MASK${NORMAL} = ${column2_background}${column2_font_color}$( /sbin/ifconfig | grep 'netmask')${NORMAL}"
echo -e "${column1_background}${column1_font_color}GATEWAY${NORMAL} = ${column2_background}${column2_font_color}$(ip -4 route show default)${NORMAL}"
echo -e "${column1_background}${column1_font_color}RAM_TOTAL${NORMAL} = ${column2_background}${column2_font_color}$(grep MemTotal /proc/meminfo)${NORMAL}"
echo -e "${column1_background}${column1_font_color}RAM_USED${NORMAL} = ${column2_background}${column2_font_color}$(vmstat -s | grep 'used m')${NORMAL}"
echo -e "${column1_background}${column1_font_color}RAM_FREE${NORMAL} = ${column2_background}${column2_font_color}$(grep MemFree /proc/meminfo)${NORMAL}"
echo -e "${column1_background}${column1_font_color}SPACE_ROOT${NORMAL} = ${column2_background}${column2_font_color}\n $(df -hT | grep '/$\|Filesystem')${NORMAL}"


