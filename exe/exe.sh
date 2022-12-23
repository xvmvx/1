#!/bin/bash
clear
echo "##################################################"
echo "                安装应用                          "
echo "=================================================="
echo "-----  1.       Xswitch"
echo "-----  2.       FusionPBX"
echo "-----  3.       NextCloud"
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
    source /var/1/exe/pbx/xswitch.sh
  else
    echo " 需要在docker-compose环境中运行，正在安装docker，安装完毕请再次运行本程序"
    source /var/1/tool/docker/d.sh
  fi
;;
2 )
  echo "-----  1.       准备安装"
  echo "-----  2.       官网Debian标准安装"
  echo "-----  3.       Docker安装"
  echo "请选择要执行的操作，返回上层请按 0  返回顶层请按 00 退出直接回车即可"
  read -p ">>>>>>>>>>>>>>>>" character
  if [ "$character" = "1" ]; then
    echo "本过程执行结束将会重新启动，重新启动后请再次进行安装！"
    sudo apt-get update && sudo apt-get upgrade
    sudo apt-get install systemd && sudo apt-get install systemd-sysv
    sudo apt-get install ca-certificates && reboot
  elif [ "$character" = "2" ]; then
    wget -O - https://raw.githubusercontent.com/fusionpbx/fusionpbx-install.sh/master/debian/pre-install.sh | sh;
    cd /usr/src/fusionpbx-install.sh/debian && ./install.sh
  elif [ "$character" = "3" ]; then
    echo "木有！"
  fi
;;
3 )
  clear
  echo "###########################################"
    cp /var/1/exe/nextcloud /var/nextcloud && cd /var/nextcloud
    docker-compose up -d || echo " 需要在docker-compose环境中运行，正在安装docker，安装完毕请再次运行本程序"
    source /var/1/tool/docker/d.sh
;;
0 )
  source /var/1/exe/exe.sh
;;
00 )
  source /var/1/1.sh
;;
* )
clear
esac
