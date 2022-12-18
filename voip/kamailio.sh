#!/bin/bash
# 添加 Kamamilio 源公钥
wget http://deb.kamailio.org/kamailiodebkey.gpg
sudo apt-key add kamailiodebkey.gpg && sudo mv /etc/apt/sources.list /etc/apt/sources.list.beifen
cp /var/1/voip/sources.list /etc/apt/sources.list && sudo apt update
# wget -O- https://deb-archive.kamailio.org/kamailiodebkey.gpg | sudo apt-key add -
# echo "deb       https://deb-archive.kamailio.org/repos/kamailio-5.6.2 buster main" >> /etc/apt/sources.list
# echo "deb-src   https://deb-archive.kamailio.org/repos/kamailio-5.6.2 buster main" >> /etc/apt/sources.list  
sudo apt update && sudo apt install default-mysql-server
sudo apt install kamailio kamailio-mysql-modules kamailio-websocket-modules
sudo apt install kamailio-autheph-modules kamailio-berkeley-bin kamailio-berkeley-modules kamailio-cnxcc-modules kamailio-cpl-modules kamailio-dbg \
kamailio-erlang-modules kamailio-extra-modules kamailio-geoip-modules kamailio-geoip2-modules kamailio-ims-modules kamailio-json-modules \
kamailio-kazoo-modules kamailio-ldap-modules kamailio-lua-modules kamailio-memcached-modules kamailio-mongodb-modules kamailio-mono-modules \
kamailio-mqtt-modules  kamailio-nth kamailio-outbound-modules kamailio-perl-modules kamailio-phonenum-modules \
kamailio-postgres-modules kamailio-presence-modules kamailio-python-modules kamailio-python3-modules kamailio-rabbitmq-modules kamailio-radius-modules \
kamailio-redis-modules kamailio-ruby-modules kamailio-sctp-modules kamailio-snmpstats-modules kamailio-sqlite-modules kamailio-systemd-modules \
kamailio-tls-modules kamailio-unixodbc-modules kamailio-utils-modules  kamailio-xml-modules kamailio-xmpp-modules kamcli resource-agents
rpm -qa | grep mysql && rpm -e --nodeps mysql
apt-get install mysql-server mysql-client
