#!/bin/bash
wget -O- https://deb-archive.kamailio.org/kamailiodebkey.gpg | sudo apt-key add -
echo "deb       https://deb-archive.kamailio.org/repos/kamailio-5.6.2 buster main" >> /etc/apt/sources.list
echo "deb-src   https://deb-archive.kamailio.org/repos/kamailio-5.6.2 buster main" >> /etc/apt/sources.list  
sudo apt update && sudo apt install default-mysql-server
sudo apt install kamailio kamailio-mysql-modules
sudo apt install kamailio-autheph-modules kamailio-berkeley-bin kamailio-berkeley-modules kamailio-cnxcc-modules kamailio-cpl-modules kamailio-dbg \
kamailio-erlang-modules kamailio-extra-modules kamailio-geoip-modules kamailio-geoip2-modules kamailio-ims-modules kamailio-json-modules \
kamailio-kazoo-modules kamailio-ldap-modules kamailio-lua-modules kamailio-memcached-modules kamailio-mongodb-modules kamailio-mono-modules \
kamailio-mqtt-modules kamailio-mysql-modules kamailio-nth kamailio-outbound-modules kamailio-perl-modules kamailio-phonenum-modules \
kamailio-postgres-modules kamailio-presence-modules kamailio-python-modules kamailio-python3-modules kamailio-rabbitmq-modules kamailio-radius-modules \
kamailio-redis-modules kamailio-ruby-modules kamailio-sctp-modules kamailio-snmpstats-modules kamailio-sqlite-modules kamailio-systemd-modules \
kamailio-tls-modules kamailio-unixodbc-modules kamailio-utils-modules kamailio-websocket-modules kamailio-xml-modules kamailio-xmpp-modules \
kamcli resource-agents
