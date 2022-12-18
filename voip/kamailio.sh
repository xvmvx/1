#!/bin/bash
# 添加 Kamamilio 源公钥
# wget http://deb.kamailio.org/kamailiodebkey.gpg
# sudo apt-key add kamailiodebkey.gpg && sudo mv /etc/apt/sources.list /etc/apt/sources.list.beifen
# cp /var/1/voip/sources.list /etc/apt/sources.list && sudo apt update
# wget -O- https://deb-archive.kamailio.org/kamailiodebkey.gpg | sudo apt-key add -
# echo "deb       https://deb-archive.kamailio.org/repos/kamailio-5.6.2 buster main" >> /etc/apt/sources.list
# echo "deb-src   https://deb-archive.kamailio.org/repos/kamailio-5.6.2 buster main" >> /etc/apt/sources.list  
# sudo apt update && sudo apt install default-mysql-server
# sudo apt install kamailio kamailio-mysql-modules kamailio-websocket-modules
# sudo apt install kamailio-autheph-modules kamailio-berkeley-bin kamailio-berkeley-modules kamailio-cnxcc-modules kamailio-cpl-modules kamailio-dbg \
# kamailio-erlang-modules kamailio-extra-modules kamailio-geoip-modules kamailio-geoip2-modules kamailio-ims-modules kamailio-json-modules \
# kamailio-kazoo-modules kamailio-ldap-modules kamailio-lua-modules kamailio-memcached-modules kamailio-mongodb-modules kamailio-mono-modules \
# kamailio-mqtt-modules  kamailio-nth kamailio-outbound-modules kamailio-perl-modules kamailio-phonenum-modules \
# kamailio-postgres-modules kamailio-presence-modules kamailio-python-modules kamailio-python3-modules kamailio-rabbitmq-modules kamailio-radius-modules \
# kamailio-redis-modules kamailio-ruby-modules kamailio-sctp-modules kamailio-snmpstats-modules kamailio-sqlite-modules kamailio-systemd-modules \
# kamailio-tls-modules kamailio-unixodbc-modules kamailio-utils-modules  kamailio-xml-modules kamailio-xmpp-modules kamcli resource-agents
# rpm -qa | grep mysql && rpm -e --nodeps mysql
# apt-get install mysql-server mysql-client

IP=$(curl ip.sb)
sudo apt-get update -y && sudo apt-get install gnupg2 mariadb-server curl unzip -y
wget -O- http://deb.kamailio.org/kamailiodebkey.gpg | apt-key add -
echo " deb http://cz.archive.ubuntu.com/ubuntu bionic main " >> /etc/apt/sources.list.d/kamailio.list
echo " deb http://deb.kamailio.org/kamailio53 bionic main " >> /etc/apt/sources.list.d/kamailio.list
echo " deb-src http://deb.kamailio.org/kamailio53 bionic main " >> /etc/apt/sources.list.d/kamailio.list
sudo apt-get update -y && sudo apt-get install kamailio kamailio-mysql-modules kamailio-websocket-modules kamailio-tls-modules -y
kamailio -V && echo "  SIP_DOMAIN= ${IP}" >> /etc/kamailio/kamctlrc
echo "  DBENGINE=MYSQL " >> /etc/kamailio/kamctlrc
echo "  ## database host " >> /etc/kamailio/kamctlrc
echo "  DBHOST=localhost " >> /etc/kamailio/kamctlrc
echo "  要求提供密码时 直接回车 MySQL password for root: 编码时，输入 utf32.。。。。-e Enter character set name: utf32 " 
kamdbctl create
sed '/#!KAMAILIO/a\#!define WITH_MYSQL\#!define WITH_AUTH \#!define WITH_USRLOCDB  \#!define WITH_ACCDB' /etc/kamailio/kamailio.cfg
systemctl restart kamailio && systemctl status kamailio
sudo apt-get install apache2 php libapache2-mod-php php-mysql php-gd php-curl php-xml php-pear && make git -y
pear install XML_RPC2 && cd /var/www/
git clone https://github.com/asipto/siremis && cd siremis
make apache24-conf | tee /etc/apache2/sites-enabled/siremis.conf
make prepare24 && make chown
echo "  登录数据库，创建一个新的 siremis 用户并授予 siremis 数据库的所有权限：" 
echo "  GRANT ALL PRIVILEGES ON siremis.* TO siremis@localhost IDENTIFIED BY 'Guwei888';" 
echo "  flush privileges;" 
echo "  exit;" 
mysql
GRANT ALL PRIVILEGES ON siremis.* TO siremis@localhost IDENTIFIED BY 'Guwei888';
flush privileges;
exit;
a2enmod rewrite
systemctl restart apache2

echo -n "  http://" ; ${IP}; echo "/siremis   用户名和密码为 admin / admin"

