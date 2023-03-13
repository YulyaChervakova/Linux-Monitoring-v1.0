#!/bin/bash
colorInput=$1
case "$colorInput" in
'\033[37m'|'\033[47m') colorName='white' colorNumber=1;;
'\033[31m'|'\033[41m') colorName='red' colorNumber=2;;
'\033[32m'|'\033[42m') colorName='green' colorNumber=3;;
'\033[34m'|'\033[44m') colorName='blue' colorNumber=4;;
'\033[35m'|'\033[45m') colorName='purple' colorNumber=5;;
'\033[30m'|'\033[40m') colorName='black' colorNumber=6;;
* ) echo "Error color"
exit 1;;
esac