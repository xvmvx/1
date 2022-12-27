#!/bin/bash
red(){
    echo -e "\033[31m\033[01m$1\033[0m"
}
green(){
    echo -e "\033[32m\033[01m$1\033[0m"
}
yellow(){
    echo -e "\033[33m\033[01m$1\033[0m"
}
blue(){
    echo -e "\033[34m\033[01m$1\033[0m"
}


logo="$(tput setaf 6)
   ____                 ___        __
  / ___| ___   ___   __| \ \      / /_ _ _   _ 
 | |  _ / _ \ / _ \ / _` |\ \ /\ / / _` | | | |
 | |_| | (_) | (_) | (_| | \ V  V / (_| | |_| |
  \____|\___/ \___/ \__,_|  \_/\_/ \__,_|\__, |
                                         |___/ 
$(tput sgr0)"

logo1="$(tput setaf 6)
    ▄▄▄▄                             ▄▄ ▄▄      ▄▄                    
  ██▀▀▀▀█                            ██ ██      ██                    
 ██         ▄████▄    ▄████▄    ▄███▄██ ▀█▄ ██ ▄█▀  ▄█████▄  ▀██  ███ 
 ██  ▄▄▄▄  ██▀  ▀██  ██▀  ▀██  ██▀  ▀██  ██ ██ ██   ▀ ▄▄▄██   ██▄ ██  
 ██  ▀▀██  ██    ██  ██    ██  ██    ██  ███▀▀███  ▄██▀▀▀██    ████▀  
  ██▄▄▄██  ▀██▄▄██▀  ▀██▄▄██▀  ▀██▄▄███  ███  ███  ██▄▄▄███     ███   
    ▀▀▀▀     ▀▀▀▀      ▀▀▀▀      ▀▀▀ ▀▀  ▀▀▀  ▀▀▀   ▀▀▀▀ ▀▀     ██    
                                                              ███     
$(tput sgr0)"


xitong=$(cat /etc/issue)
IP1=$(curl ip.sb)
IP2=$(ip route get 1 | awk '{print $7;exit}')
CentOS="CentOS"
VSP="请自行添加"
server="请自行修改"

  case "$IP1" in
  45.43.57.207)
  	VSP="UCLOUD:chenlang1940@163.com:Ab123456."
	server="PHP+bt+昊昊.中国+com--x.com"
  ;;
  121.37.203.3)
  	VSP="华为☁️:hw17604827824:Ab123456"
	server="VOS3000"
  ;;
  124.71.218.178)
  	VSP="华为☁️:hw752541:Ab123456"
	server="猫网页聊天"
  ;;
  139.9.73.181)
  	VSP="华为☁️:hw13318275344:Ab123456"
	server="不详"
  ;;
  121.11.114.77)
  	VSP="天冀☁️:46586262@qq.com:Tzq.2580"
	server="XSwitch"
  ;;
  1.117.233.33)
  	VSP="腾讯☁️:ijqomv@163.com:one@12345"
	server="FreePBX"
  ;;
  1.116.119.155)
  	VSP="腾讯☁️:dakqf76@163.com:qwer1234."
	server="XSwitch"
  ;;
  80.251.214.252)
  	VSP="搬瓦工:dakqf76@163.com:qwer1234."
	server="teie.mobi+matrix+NPM"
  ;;
  137.175.36.42)
  	VSP="raksmart:wing.999@icloud.com:Guwei888"
	server="https://billing.raksmart.com/whmcs/clientarea.php"
  ;;
  139.159.182.63)
  	VSP="华为☁️:hw16623829517hw55582339:Ab23456"
	server="FreePBX☎️"
  ;;
   *) 	VSP="请自行添加"
	server="请自行修改" 
esac

rm -rf ~/.bashrc 
cp /var/1/bashrc.txt ~/.bashrc
source ~/.bashrc 
clear
rm -rf /etc/profile.d/pro.sh 
cp /var/1/pro.sh /etc/profile.d/pro.sh
yellow "${logo1}"
red "########################################"
bule -n "-----本机系统是：" ; green "${xitong%(Final)*}"
result=$(echo $xitong | grep "${CentOS}")
if [[ "$result" != "" ]]
then
    green "-----本机IP请使用ifconfig -a 检测"
else
    blue -n "-----本机公网IP是："; green "${IP1}"
    blue -n "-----本机内网IP是："; green "${IP2}"
fi
blue -n "-----本机服务商信息:"; green "${VSP}"
blue -n "-----本机服务已启用：";green "${server}"
yellow "====================================="
yellow "----------     My goodway    --------"
yellow "====================================="
echo " "
echo " "
green "----- 测试工具： 1.            集成工具   "
green "----- 优化加速： 2.            性能检测 "
green "----- 系统环境： 3.            DD系统"
green "----- 工具依赖： 4.            工具tool"
green "----- 应用依赖： 5.            应用exe"
green "----- 参考帮助： 6.            帮助help"
echo "请选择要执行的操作，退出直接回车即可"
read -p ">>>>>>>>>>>>>>>>" menuNumberInput
  case "$menuNumberInput" in
    1 )
      	source /var/1/gongju.sh
    ;;
    2 )
    	source /var/1/ceshi.sh
    ;;
    3 )
    	source /var/1/dd.sh
    ;;
    4 )
    	source /var/1/tool/tool.sh
    ;;
    5 )
    	source /var/1/exe/exe.sh
    ;;
    6 )
    	source /var/1/help.sh
    ;;
    * )
      clear
      esac
