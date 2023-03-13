#!/bin/bash
# 1. Total number of folders, including subfolders
number=$(sudo find $1 -type d | wc -l)
echo -e "Total number of folders (including all nested ones) = $number\n"
# 2. Top 5 folders with largest size in descending order (path and size)
number=$(sudo du -a -h $1 | sort -rh | head -5 | nl -w1 -s ' - ')
echo -e "Top 5 folders with largest size in descending order (path and size) = \n$number"
# 3. Total number of files
number=$(sudo find $1 -type f | wc -l )
echo -e "\nTotal number of files = $number"
# 4. Number of configuration files (with .conf extension), 
# text files, executable files, log files (files with .log extension), archives, symbolic links
number=$(sudo find $1 -type f -name "*.conf" | wc -l)
echo "Total number of files *.conf = $number"
number=$(sudo find $1 -type f -name "*.txt" | wc -l)
echo "Total number of files *.txt = $number"

number=$(sudo find $1 -type f -perm /a=x | wc -l)
echo "Total number of files executable files = $number"

number=$(sudo find $1 -type f -name "*.log" | wc -l)
echo "Total number of files *.log = $number"

number=$(sudo find $1 -regextype egrep \
       -iregex '.*\.(zip|7z|iso|cpio|ar?|tar(|\.[gx]z|\.bz2)|tgz|tbz2)' \
       -type f | wc -l)
echo "Total number of files archives = $number"

number=$(sudo find $1 -type l -ls | wc -l)
echo -e "Total number of files symbolic links = $number \n"
# 5. Top 10 files with largest size in descending order (path, size and type)
number=$(sudo find $1 -type f -exec du -Sh {} + | sort -nr | head -10)
echo $number>number.txt
echo -e "TOP 10 files of maximum size arranged in descending order "
file="number.txt"
i=1
n=1
for var in $(cat $file)
do
if [[ n -eq 2 ]]; then
a=`ls -i $var | sed 's|.*/||'`
var1=`echo $a | awk -F'[/.]' '{print $(NF)}'`
echo " $var, $init, .$var1"
n=1
else 
init=$var
echo -e "$i - \c"
i=$[ i+1 ]
n=2
fi
done
rm number.txt	
# 6. Top 10 executable files with largest size in descending order (path, size and hash)
number=$(sudo find $1 -type f -exec du -Sh {} + | sort -nr | head -10)
echo $number>number.txt
echo -e "\n \nTop 10 executable files with largest size in descending order"
file="number.txt"
i=1
n=1
for var in $(cat $file)
do
if [[ n -eq 2 ]]; then
a=`ls -i $var | sed 's|.*/||'`
var1=`echo $var | md5sum $var | awk '{print $1}'`
echo " $var, $init, $var1"
n=1
else 
init=$var
echo -e "$i - \c"
i=$[ i+1 ]
n=2
fi
done
rm number.txt
# 7. Execution time of the script
