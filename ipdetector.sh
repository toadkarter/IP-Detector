#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Sorry, there is a parameters problem.">&2
    echo "Syntax: ./ipdetector.sh [XXX.XXX.X]"
    exit 1
fi


for ip in {1..254..1}; do

    ping -c 1 "$1"."$ip" | grep "64 bytes" | cut -d" " -f4 | sed "s/://"&

done

exit 0



