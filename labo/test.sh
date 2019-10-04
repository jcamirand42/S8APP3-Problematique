#!/bin/bash

cd /etc/tripwire

SITE_PASS=asdf
LOCAL_PASS=asdf

# Generate site key
yes Y | twadmin --generate-keys --site-keyfile site.key -Q $SITE_PASS

# Generate local key
yes Y | twadmin --generate-keys --local-keyfile ${HOSTNAME}-local.key -P $LOCAL_PASS

# Signing the configuration file
twadmin --create-cfgfile --cfgfile tw.cfg --site-keyfile site.key -Q $SITE_PASS twcfg.txt

# Signing the Policy file
twadmin --create-polfile --cfgfile tw.cfg --site-keyfile site.key -Q $SITE_PASS twpol.txt

# Add access permissions and ownerships (by root group user using chmod 640)
chown root:root site.key ${HOSTNAME}-local.key tw.cfg tw.pol
chmod 640 site.key ${HOSTNAME}-local.key tw.cfg tw.pol

#Generate the inital tripwire db
tripwire --init -P $LOCAL_PASS

sudo rm /etc/proftpd/proftpd.conf
cp /proftpd.conf /etc/proftpd/proftpd.conf
sudo useradd admin
echo "admin:admin" | sudo chpasswd
sudo usermod -m -d /var/www/ admin
mkdir /var/www
sudo service proftpd restart

cd /

/bin/bash