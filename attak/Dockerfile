FROM metasploitframework/metasploit-framework:latest

COPY src/nmap.sh /home/msf/
COPY src/samba-payload.sh /usr/src/metasploit-framework/samba-payload.sh
COPY src/samba-script.sh /usr/src/metasploit-framework/samba-script.sh
COPY src/ftp-payload.sh /usr/src/metasploit-framework/ftp-payload.sh
COPY src/ftp-script.sh /usr/src/metasploit-framework/ftp-script.sh
COPY src/notice-me.txt /usr/src/metasploit-framework/notice-me.txt
RUN apk add nmap ;\
 apk add lftp ;\
 chmod 755 /home/msf/nmap.sh ;\
 chmod 755 /usr/src/metasploit-framework/samba-payload.sh ;\
 chmod 755 /usr/src/metasploit-framework/samba-script.sh ;\
 chmod 755 /usr/src/metasploit-framework/ftp-payload.sh ;\
 chmod 755 /usr/src/metasploit-framework/ftp-script.sh
CMD /home/msf/nmap.sh & /usr/src/metasploit-framework/samba-script.sh & /usr/src/metasploit-framework/ftp-script.sh
