#!/bin/bash
export color=$1
case "$color" in
1) color='\033[47m';;
2) color='\033[41m';;
3) color='\033[42m';;
4) color='\033[44m';;
5) color='\033[45m';;
6) color='\033[40m';;
esac
