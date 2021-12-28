#!/bin/bash

# Check if correct parameters, if not, error message
if [ "$#" -ne 1 ]; then
    echo "Sorry, there is a parameters problem.">&2
    echo "Syntax: ./ipdetector.sh [XXX.XXX.X]">&2
    exit 1
fi

# Cycle through all available IP addresses
for ip in {1..254..1}; do

    # Ping current address, check if online, get the address from output stream, remove colon
    ping -c 1 "$1"."$ip" | grep "64 bytes" | cut -d" " -f4 | sed "s/://"&

done

exit 0



