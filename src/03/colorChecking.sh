#!/bin/bash
# Color don`t matches
if [[ $1 -eq $2 ]]; then
    echo "Цвет фона и шрифта совпадает, попробуй еще раз."
    exit 1
fi

if [[ $3 -eq $4 ]]; then
    echo "Цвет фона и шрифта совпадает, попробуй еще раз."
    exit 1
fi