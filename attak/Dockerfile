FROM metasploitframework/metasploit-framework:latest

COPY src/nmap.sh /home/msf/
COPY src/samba-payload.sh /usr/src/metasploit-framework/samba-payload.sh
COPY src/samba-script.sh /usr/src/metasploit-framework/samba-script.sh
RUN apk add nmap ; chmod 755 /home/msf/nmap.sh ; chmod 755 /usr/src/metasploit-framework/samba-payload.sh ; chmod 755 /usr/src/metasploit-framework/samba-script.sh
CMD /home/msf/nmap.sh & /usr/src/metasploit-framework/samba-script.sh
