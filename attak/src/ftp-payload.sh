#!/bin/sh
lftp -c "open -u admin,admin target; put -O ./ ./notice-me.txt"