#!/bin/bash
clear
echo "##################################################"
echo "                 安装工具及应用                      "
echo "=================================================="
echo "-----  1.       安装工具 "
echo "-----  2.       安装应用 "
echo "-----  3.        "
echo "-----  4.        "
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
echo "##################################################"
read -p "按照提示输入正确的数字  返回上层请按 0  ，退出请回车>>>>>>>>>" installINPUT
  case "$installINPUT" in
   1 )
        echo "##################################################"
        echo "                 安装工具                           "
        echo "=================================================="
        echo "-----  1.       docker"
        echo "-----  2.       宝塔"
        echo "-----  3.       npm"
        echo "-----  4.       golang"
        echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
        echo "##################################################"
      read -p "按照提示输入正确的数字  返回上层请按 0  ，退出请回车>>>>>>>>>" menuNumberInput
      case "$menuNumberInput" in
       1 )
            echo "-----  1.最完整的一键脚本"
            echo "-----  2.官方docker"
            echo "-----  3.官方docker-compose"
            echo "请选择要执行的操作，返回上层请按 0  退出直接回车即可"
            read -p ">>>>>>>>>>>>>>>>" character
              if [ "$character" = "1" ]; then
                  source /var/1/docker/d.sh
              elif [ "$character" = "2" ]; then
                  sudo apt-get remove docker docker-engine docker.io containerd runc || sudo yum install apt-get
                  sudo apt-get update && sudo apt-get install ca-certificates curl gnupg lsb-release
                  sudo mkdir -p /etc/apt/keyrings
                  sudo curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
                  sudo echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
                  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
                  sudo apt-get update && sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
              elif [ "$character" = "3" ]; then
                  curl -L https://get.daocloud.io/docker/compose/releases/download/1.27.4/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
                  chmod +x /usr/local/bin/docker-compose
                  ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
              elif [ "$character" = "0" ]; then
                  source /var/1/1.sh
              else
                  echo 输入不符合要求
              fi
        ;;
        2 )
            wget -O install.sh http://f.cccyun.cc/bt/install_6.0.sh && bash install.sh
            sed -i "s|bind_user == 'True'|bind_user == 'XXXX'|" /www/server/panel/BTPanel/static/js/index.js
            rm -f /www/server/panel/data/bind.pl && curl -sSO https://raw.githubusercontent.com/ztkink/bthappy/main/one_key_happy.sh && bash one_key_happy.sh
            wget -O optimize.sh http://f.cccyun.cc/bt/optimize.sh && bash optimize.sh && curl https://io.bt.sy/install/update_panel.sh|bash
        ;;    
        3 )    
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
        4 )
            clear
            echo "###########################################"
            wget https://storage.googleapis.com/golang/go1.19.4.linux-amd64.tar.gz || wget https://dl.google.com/go/go1.19.4.linux-amd64.tar.gz
            sudo tar -xzf go1.19.4.linux-amd64.tar.gz -C /usr/local 
            echo "export GOROOT=/usr/local/go" >> /etc/profile 
            echo "export GOBIN=$GOROOT/bin" >> /etc/profile 
            echo "export PATH=$PATH:$GOBIN" >> /etc/profile 
            echo "export GOPATH=$HOME/gopath" >> /etc/profile 
            source /etc/profile 
            go version
            if [ "$?" != "0" ]; then
              echo " golang安装成功！"
            else
              echo " 安装失败，请检查"
            fi
        ;;
        0 )
            source /var/1/1.sh
        ;;
    2 )
        echo "##################################################"
        echo "                 安装应用                          "
        echo "=================================================="
        echo "-----  1.       Xswitch"
        echo "-----  2.        "
        echo "-----  3.        "
        echo "-----  4.        "
        echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
        echo "##################################################"
      read -p "按照提示输入正确的数字  返回上层请按 0  ，退出请回车>>>>>>>>>" installEXE
      case "$installEXE" in
      1 )
            clear
            echo "###########################################"
            docker-compose version
            if [ "$?" = "0" ]; then
              source /var/1/xswitch.sh
            else
              echo " 需要在docker-compose环境中运行，正在安装docker，安装完毕请再次运行本程序"
              source /var/1/docker/d.sh
            fi
        ;;
        2 )
            go version
            
            yum install systemd || apt install systemd
            cp  /var/1/frp/frps.service /etc/systemd/system/frps.service
            systemctl start frps
            echo "停止frp  systemctl stop frps
            重启frp  systemctl restart frps
            查看frp状态 systemctl status frps"
            systemctl enable frps
          wget https://github.com/fatedier/frp/releases/download/v0.46.0/frp_0.46.0_linux_amd64.tar.gz
        ;;
       0 )
            source /var/1/1.sh
       ;;
    * )
       clear
       esac
