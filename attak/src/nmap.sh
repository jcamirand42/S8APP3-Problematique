#!/bin/bash
while true; do
    nmap -sV 10.103.0.0/24 --top-ports 100 >> /home/msf/nmap.log
    sleep 240
done