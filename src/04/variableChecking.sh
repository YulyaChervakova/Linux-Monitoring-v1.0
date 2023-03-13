#!/bin/bash
if [ "$#" -gt 0 ]; then
    echo "Неверное количество аргументов."
    exit 1
fi

FILE=./config.conf
#file exist
if [ ! -f "$FILE" ]; then
    echo "Файл $FILE не существует"
    exit 1
fi