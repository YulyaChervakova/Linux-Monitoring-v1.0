#!/bin/bash
TIMEFORMAT="Script execution time (in seconds) = %3R"
time {
dirName=$(dirname $0)
. ${dirName}/variableChecking.sh
. ${dirName}/action.sh
}