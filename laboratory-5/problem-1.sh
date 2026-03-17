#!/bin/bash

if [ ! -f "functions.sh" ]; then
    echo "Error: functions.sh nu exista in acest director!"
    exit 1
fi

source functions.sh

main