FROM vulhub/samba:4.6.3

COPY ./test.sh test.sh
COPY ./proftpd.conf proftpd.conf
COPY ./smb.conf /usr/local/samba/etc/smb.conf

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    build-essential \
    curl \
    nmap \
    wget \
    sudo \
    tripwire \
    vim \
    proftpd 

COPY ./twpol.txt /etc/tripwire/twpol.txt

RUN adduser --disabled-password --gecos '' docker
RUN adduser docker sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Metasploit install and setup
RUN sudo curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && sudo chmod 755 msfinstall && sudo ./msfinstall
ENV PATH="/opt/metasploit-framework/bin:${PATH}"

RUN sudo chmod +x test.sh
# CMD ["smbd -D && ./test.sh"]
CMD ["./test.sh"]
# CMD ["/usr/local/samba/sbin/smbd -D"]
