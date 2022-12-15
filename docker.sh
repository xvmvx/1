#!/bin/bash
clear
echo "##################################################"
echo "           Docker  Docker-compose    other         "
echo "=================================================="
echo "-----  1.官方docker"
echo "-----  2.官方docker-compose"
echo "-----  3.一键脚本"
echo "-----  4.宝塔"
echo "-----  5.Xswitch"
echo "-----  6.npm"
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
echo "##################################################"
read -p "按照提示输入正确的数字  返回上层请按 0  ，退出请回车>>>>>>>>>" menuNumberInput
  case "$menuNumberInput" in
    1 )
        sudo apt-get remove docker docker-engine docker.io containerd runc || sudo yum install apt-get
        sudo apt-get update && sudo apt-get install ca-certificates curl gnupg lsb-release
        sudo mkdir -p /etc/apt/keyrings
        sudo curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
        sudo echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
        $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
        sudo apt-get update && sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
    ;;
    2 )
        curl -L https://get.daocloud.io/docker/compose/releases/download/1.27.4/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
        chmod +x /usr/local/bin/docker-compose
        ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
    ;;    
    3 )    
        source /var/1/d.sh
    ;;
    4 )
        wget -O install.sh http://f.cccyun.cc/bt/install_6.0.sh && bash install.sh
        sed -i "s|bind_user == 'True'|bind_user == 'XXXX'|" /www/server/panel/BTPanel/static/js/index.js
        rm -f /www/server/panel/data/bind.pl && curl -sSO https://raw.githubusercontent.com/ztkink/bthappy/main/one_key_happy.sh && bash one_key_happy.sh
        wget -O optimize.sh http://f.cccyun.cc/bt/optimize.sh && bash optimize.sh && curl https://io.bt.sy/install/update_panel.sh|bash
    ;;
    5 )
        clear
        echo "###########################################"
        echo " 需要在docker-compose环境中运行，请确定已经正确安装"
        cd /var/1/xswitch
        chmod +x *
        source /var/1/xswitch/xswitch.sh
    ;;
    6 )
        clear
        mkdir /var/npm
        cp /var/1/npm.yml  /var/npm/docker-compose.yml
        cd /var/npm/
    	echo "###########################################"
        echo " 需要在docker-compose环境中运行，请确定已经正确安装"
        docker-compose up -d
        echo " http：//yourIP:81 登录，用户名：admin@excaple.com 密码：changeme"
        echo " 占用  80  81  443 端口"
        cd /var/1
    ;;
    0 )
        source /var/1/1.sh
    ;;
    * )
          clear
          esac