#!/bin/bash
clear
echo "##################################################"
echo "              DD      WARP      BBR          "
echo "=================================================="
echo "-----  1.DD安装 DD组件 国内DD 国外DD 中文debian "
echo "-----  2.WARP "
echo "-----  3.BBR "
echo "-----  4.呆梨 -XUI -make"
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
echo "##################################################"
echo " "
echo " "
echo "请选择要执行的操作，返回上层请按 0  退出直接回车即可"
read -p ">>>>>>>>>>>>>>>>" menuNumberInputdd
  case "$menuNumberInputdd" in
    1 )
    	clear
    	echo  ">>>>>>>>>>>>>>>>>>"
    	echo  "按1     安装组件"
    	echo  "按2     国内DD"
    	echo  "按3     国外DD"
    	echo  "按4     综合DD"
	echo  "按5     中文debian"
	echo  "按6     查看密码"
    	echo "请选择要执行的操作，返回上层请按 0  退出直接回车即可"
    	read -p ">>>>>>>>>>>>>>>>" character1
    	if [ "$character1" = "1" ]; then
            apt-get install -y xz-utils openssl gawk file wget screen && screen -S os || yum install -y xz openssl gawk file glibc-common wget screen && screen -S os
            if [ "$?" = "0" ]; then
                echo "组件安装成功，将为你刷新Mirrors缓存和更换镜像源 "
            else
                echo "组件安装失败，请检查！" 1>&2
            	exit 1
            fi
            yum makecache && yum update -y || apt update -y && apt dist-upgrade -y
            if [ "$?" = "0" ]; then
                echo "已更换镜像源 "
            else
                echo "更换镜像源失败，请检查！" 1>&2
            	exit 1
            fi
        elif [ "$character1" = "2" ]; then
		    echo -n "国内主机安装25合一DD"
            echo -n "按1    经典版本"
            echo -n "按2    最新版本"
            echo "请选择要执行的操作，返回上层请按 0  退出直接回车即可"
            read -p ">>>>>>>>>>>>>>>>" character2
            if [ "$character2" = "1" ]; then
            	wget --no-check-certificate -O AutoReinstall.sh https://cdn.jsdelivr.net/gh/fcurrk/reinstall@master/AutoReinstall.sh && chmod a+x AutoReinstall.sh && bash AutoReinstall.sh
            elif [ "$character2" = "2" ]; then
            	wget --no-check-certificate -O NewReinstall.sh https://cdn.jsdelivr.net/gh/fcurrk/reinstall@master/NewReinstall.sh && chmod a+x NewReinstall.sh && bash NewReinstall.sh
            elif [ "$character2" = "0" ]; then
                source /var/1/1.sh
            else
            	echo 输入不符合要求
            fi
        elif [ "$character1" = "3" ]; then
            echo -n "国外主机安装25合一DD"
            echo -n "按1    经典版本"
            echo -n "按2    最新版本"
            echo "请选择要执行的操作，返回上层请按 0  退出直接回车即可"
            read -p ">>>>>>>>>>>>>>>>" character3
            if [ "$character3" = "1" ]; then
                wget --no-check-certificate -O AutoReinstall.sh https://git.io/betags && chmod a+x AutoReinstall.sh && bash AutoReinstall.sh
            elif [ "$character3" = "2" ]; then
                wget --no-check-certificate -O NewReinstall.sh https://git.io/newbetags && chmod a+x NewReinstall.sh && bash NewReinstall.sh
            elif [ "$character3" = "0" ]; then
                source /var/1/1.sh
            else
            	echo 输入不符合要求
            fi
        elif [ "$character1" = "4" ]; then
            	wget -N --no-check-certificate https://down.vpsaff.net/linux/dd/network-reinstall-os.sh && \
            	chmod +x network-reinstall-os.sh && ./network-reinstall-os.sh
	 elif [ "$character1" = "5" ]; then
	    	apt-get -y install wget
		wget -c -O atzlinux-v11-archive-keyring_lastest_all.deb https://www.atzlinux.com/atzlinux/pool/main/a/atzlinux-archive-keyring/atzlinux-v11-archive-keyring_lastest_all.deb
		apt -y install ./atzlinux-v11-archive-keyring_lastest_all.deb
		apt-get update
		apt-get -y install xdg-utils
		apt-get -y install xfce4-settings
		apt-get -y install libcanberra-gtk-module
		apt-get -y install electronic-wechat
		apt-get -y install linuxqq
		apt-get -y install \
		fcitx-config-common \
		fcitx-config-gtk \
		fcitx-frontend-all \
		fcitx-frontend-qt5 \
		fcitx-googlepinyin \
		fcitx-m17n \
		fcitx-module-x11 \
		fcitx-sunpinyin \
		fcitx-table-wubi \
		fcitx-table-wbpy \
		fcitx-ui-classic
		apt-get -y install sogoupinyin
		rm -f /etc/apt/sources.list.d/sogoupinyin.list
		apt-get -y install fonts-zh-cn-misc-atzlinux
		apt-get -y install desktop-file-utils
		apt-get -y install baidunetdisk
		apt-get -y install netease-cloud-music
		apt-get -y install app.web.youdao.dict
		apt-get -y install ttf-mscorefonts-atzlinux
		apt-get -y install wps-office wps-office-fonts
		apt-get -y install atzlinux-store-a11
		echo "安装成功，请退出当前登录，重新登录，让安装生效。"
	elif [ "$character1" = "6" ]; then
		echo " 4 密码 ： IdcOffer.com " 
		echo " 5 密码 ： wo 密码为：debian168;  root 密码为：debian-cn;168 "
        elif [ "$character1" = "0" ]; then
            source /var/1/1.sh
        else
        	echo 输入不符合要求
        fi
    ;;
    2 )
    	wget -N --no-check-certificate https://cdn.jsdelivr.net/gh/YG-tsj/CFWarp-Pro/multi.sh && chmod +x multi.sh && ./multi.sh
    ;;
    3 )
    	clear
    	echo  ">>>>>>>>>>>>>>>>>>"
    	echo  "按1 Centos7 BBR"
    	echo  "按2 一键开启BBR"
    	echo "请选择要执行的操作，返回上层请按 0  退出直接回车即可"
    	read -p ">>>>>>>>>>>>>>>>" characterb
    	if [ "$characterb" = "1" ]; then
            wget -N --no-check-certificate "https://raw.githubusercontent.com/chiakge/Linux-NetSpeed/master/tcp.sh" && chmod +x tcp.sh && ./tcp.sh
        elif [ "$characterb" = "2" ]; then
     		uname -srm
        elif [ "$characterb" = "0" ]; then
            source /var/1/1.sh
        else
        	echo 输入不符合要求
        fi
    ;;
    4 )
    clear
    	echo  ">>>>>>>>>>>>>>>>>>"
    	echo  " 呆梨的相关  "
        echo  "按1   XIU"
    	echo  "按2   make"
    	echo "请选择要执行的操作，返回上层请按 0  退出直接回车即可"
    	read -p ">>>>>>>>>>>>>>>>" characterd
    	if [ "$characterd" = "1" ]; then
            bash <(curl -Ls https://raw.githubusercontent.com/sprov065/x-ui/master/install.sh) 0.2.0
        elif [ "$characterd" = "2" ]; then
     		wget -P /root -N --no-check-certificate "https://raw.githubusercontent.com/mack-a/v2ray-agent/master/install.sh" && chmod 700 /root/install.sh && /root/install.sh
        elif [ "$characterd" = "0" ]; then
            source /var/1/1.sh
        else
        	echo 输入不符合要求
        fi
    ;;
    5 )
        source /var/1/1.sh
    ;;
    * )
      clear
      esac
