FROM ubuntu:16.04

ADD ./test.sh test.sh
ADD ./proftpd.conf proftpd.conf

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    build-essential \
    curl \
    nmap \
    wget \
    sudo \
    tripwire \
    vim \
    proftpd 

RUN adduser --disabled-password --gecos '' docker
RUN adduser docker sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Metasploit install and setup
RUN sudo curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && sudo chmod 755 msfinstall && sudo ./msfinstall
ENV PATH="/opt/metasploit-framework/bin:${PATH}"

RUN sudo chmod +x test.sh
CMD ["./test.sh"]
