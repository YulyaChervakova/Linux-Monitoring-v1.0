#!/bin/bash
color=$1
case "$color" in
1) color='\033[37m';;
2) color='\033[31m';;
3) color='\033[32m';;
4) color='\033[34m';;
5) color='\033[35m';;
6) color='\033[30m';;
* ) echo "Error color"
exit 1;;
esac