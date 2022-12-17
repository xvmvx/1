#!/bin/bash
sudo apt-get update && cd ~ 
sudo wget https://xswitch.cn/download/xswitch-install.tar.gz --user xswitch --password password && tar zxvf xswitch-install.tar.gz
rm -rf xswitch-install.tar.gz && cd ~/xswitch-install
make setup && mv .env .env.beifen
cp /var/1/xswitch.env .env
IP=$(curl ip.sb)
IP2=$(ip route get 1 | awk '{print $7;exit}')
file=~/xswitch-install/.env
echo -n "-----本机公网IP是："; echo ${IP}
echo -n "正确请按  y   不正确请按  n  >>>>>>>> "
read character
if [ "$character" = "y" ]; then
    echo "EXT_IP=${IP}">>${file}
    echo "FREESWITCH_DOMAIN=${IP}">>${file}
elif [ "$character" = "n" ]; then
    echo "重新输入要指定的公网IP:"
    read y_name
    echo "EXT_IP=${y_name}" >>${file}
    echo "FREESWITCH_DOMAIN=${y_name}">>${file}
else
    echo 输入不符合要求
fi
echo -n "-----本机内网IP是："; echo ${IP2}
echo -n "正确请按  y   不正确请按  n  >>>>>>>> "
read character2
if [ "$character2" = "y" ]; then
    echo "LOCAL_IP=${IP2}" >>${file}
    echo "# xswitch-nginx use env" >>${file}
    echo "HTTP_PORT=8081" >>${file}
    echo "NGINX_PROXY=${IP2}">>${file}
elif [ "$character2" = "n" ]; then
    echo "重新输入要指定的内网IP:"
    read y_name2
    echo "LOCAL_IP=${y_name2}">>${file}
    echo "# xswitch-nginx use env" >>${file}
    echo "HTTP_PORT=8081" >>${file}
    echo "NGINX_PROXY=${y_name2}">>${file}
else
    echo 输入不符合要求
fi
make up
if [ "$?" = "0" ]; then
  echo "已安装成功！"
  echo " >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
  echo "  " 
  echo -n " 访问Web界面     http://"; echo -n ${IP2}；echo ":8081" 
  echo " Web界面用户名：  admin  密码：admin"
  echo " 查看日志：       docker logs -f 容器名"
  echo " fs_cli控制台：   make bash"
  echo " XSwitch控制台：  make cli"
  echo " 查看数据库：      make bash-pg"
  echo " 启用Nginx：      make up-nginx"
  echo " Nginx数据库：    make bash-nginx"
else
  echo "安装失败请检查！" 1>&2
  exit 1
fi
