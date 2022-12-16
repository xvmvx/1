#!/bin/bash
sudo apt-get update && cd /var/
sudo wget https://xswitch.cn/download/xswitch-install.tar.gz --user xswitch --password password && tar zxvf xswitch-install.tar.gz
file1=$(pwd)
mv ${file1}/xswitch-install /var/xswitch && cd /var/xswitch
make setup && mv .env .env.beifen
cp /var/1/.env /var/xswitch/.env
IP=$(curl ip.sb)
IP2=$(hostname -I)
file=/var/xswitch/.env
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
echo "http://你的服务器IP:8081 访问Web界面。默认用户名和密码都是admin。也可通过执行docker ps可查看 docker 服务是否已正常启动。
如果有服务启动出错，可通过执行docker logs -f xswitch查看xswitch容器相关日志（xswitch为容器名）。"
echo " 通过执行make bash进入xswitch容器内部，然后输入fs_cli可以连接控制台查看系统运行情况。"
echo " 通过执行make up-nginx  可启用Nginx "
echo "    "
echo "    "
echo "    "
echo "进入 XSwitch 容器 执行    make bash  "
echo "进入 XSwitch 控制台   执行make cli  "
echo "进入数据库   执行make bash-pg   "
echo "进入nginx容器   执行make bash-nginx   "
