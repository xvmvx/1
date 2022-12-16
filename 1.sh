#!/bin/bash
     rm -rf /etc/profile.d/pro.sh
mv pro.sh  /etc/profile.d/pro.sh
chmod +x /etc/profile.d/pro.sh
echo "########################################"
xitong=$(cat /etc/issue)
IP=$(curl ip.sb)
IP2=$(ip route get 1 | awk '{print $7;exit}')
CentOS="CentOS"
VSP="请自行添加"
server="请自行修改"
echo -n "-----本机系统是：" ; echo ${xitong%(Final)*}
result=$(echo $xitong | grep "${CentOS}")
if [[ "$result" != "" ]]
then
    echo "-----本机IP请使用ifconfig -a 检测"
else
    echo -n "-----本机IP是："; echo ${IP}
fi

  case "$IP" in
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
echo -n "-----本机服务商信息:"; echo ${VSP}
echo -n "-----本机运行服务信息：已启用："; echo ${server}
echo "=================================================="
alias fin="find . -name"
echo "=================================================="
echo "----------          My goodway           -------- "
echo "##################################################"
echo "----- 系统： 1.集成工具   "
echo "----- 优化： 2.性能检测 "
echo "----- 加速： 3.DD WARP BBR "
echo "----- 环境： 4.Docker 宝塔"
echo "----- 依赖： 5. "
echo "----- 应用： 6. "
echo "=================================================="
echo " "
echo " "
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
    	source /var/1/docker.sh
    ;;
    5 )
        
    ;;
    6 )
        
    ;;
    7 )
       
    ;;
    8 )
       
    ;;
    * )
      clear
      esac
