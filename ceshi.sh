#!/bin/bash
clear
echo "##################################################"
echo "              性能测试 综合测试 视频测试          "
echo "=================================================="
echo "1.     杜甫测试  "
echo "2.     单线程测试 "
echo "3.     三网四网测速 "
echo "4.     端口及延迟检测"
echo "5.     媒体测试 "
echo "##################################################"
echo " "
echo " "
echo "请选择要执行的操作，返回上层请按 0  退出直接回车即可"
read -p ">>>>>>>>>>>>>>>>" menuNumberInput12
  case "$menuNumberInput12" in
    1 )
      	wget -q https://github.com/Aniverse/A/raw/i/a && bash a
    ;;
    2 )
      	bash <(curl -Lso- https://bench.im/hyperspeed)
    ;;
    3 )
        clear
        echo  ">>>>>>>>>>>>>>>>>>"
        echo  "按1 superbench测试"
        echo  "按2 Bench.sh测试"
        echo  "按3 综合测试"
        echo  "按4 四网测速"
        echo  "按5 三网测速"
        echo  "按6 三网测速"
        echo  "按7 三网测速"
        echo  "按8 三网测速"
        echo "请选择要执行的操作，返回上层请按 0  退出直接回车即可"
        read -p ">>>>>>>>>>>>>>>>" character
        	if [ "$character" = "1" ]; then
                wget -qO- git.io/superbench.sh | bash
        	elif [ "$character" = "2" ]; then
            	wget -qO- bench.sh | bash
        	elif [ "$character" = "3" ]; then
        	    curl -fsL https://ilemonra.in/LemonBenchIntl | bash -s fast
        	elif [ "$character" = "4" ]; then
        	    bash <(wget -qO- https://bench.im/hyperspeed)
        	elif [ "$character" = "5" ]; then
            	wget -O jcnf.sh https://raw.githubusercontent.com/Netflixxp/jcnfbesttrace/main/jcnf.sh && bash jcnf.sh
        	elif [ "$character" = "6" ]; then
            	bash <(curl -Lso- https://git.io/superspeed_uxh)
            elif [ "$character" = "7" ]; then
            	bash <(curl -Lso- https://dl.233.mba/d/sh/speedtest.sh)
            elif [ "$character" = "8" ]; then
                bash <(curl -Lso- https://git.io/J1SEh)
        	elif [ "$character" = "0" ]; then
        	    source /var/1/1.sh
            else
            	echo 输入不符合要求
            fi
    ;;
    4 )
        clear
        echo  ">>>>>>>>>>>>>>>>>>"
        echo  "按1 显示延迟、抖动"
        echo  "按2 25端口检测"
        echo  "按3 IPV6检测"
        echo  "按4 回程检测"
        echo  "按5 直接回程检测"
        echo  "按6 不知道是啥"
        echo "请选择要执行的操作，返回上层请按 0  退出直接回车即可"
        read -p ">>>>>>>>>>>>>>>>" character4
        if [ "$character4" = "1" ]; then
            bash <(curl -Lso- https://bench.im/hyperspeed)
        elif [ "$character4" = "2" ]; then
            telnet smtp.aol.com 25
        elif [ "$character4" = "3" ]; then    
            curl ip.p3terx.com
        elif [ "$character4" = "4" ]; then
            curl https://raw.githubusercontent.com/zhucaidan/mtr_trace/main/mtr_trace.sh|bash || wget https://raw.githubusercontent.com/nanqinlang-script/testrace/master/testrace.sh
            bash testrace.sh
        elif [ "$character" = "5" ]; then
            wget -q route.f2k.pub -O route && bash route || wget -qO- git.io/besttrace | bash
        elif [ "$character4" = "6" ]; then
            bash <(wget --no-check-certificate -O- https://dl.233.mba/d/sh/superbenchpro.sh)
        elif [ "$character4" = "0" ]; then
            source /var/1/1.sh
        else
        	echo 输入不符合要求
        fi
    ;;
    5 )
        clear
        echo  ">>>>>>>>>>>>>>>>>>"
        echo  "按1 媒体检测"
        echo  "按2 奈飞检测"
        echo "请选择要执行的操作，返回上层请按 0  退出直接回车即可"
        read -p ">>>>>>>>>>>>>>>>" character5
        if [ "$character5" = "1" ]; then
            bash <(curl -L -s https://raw.githubusercontent.com/lmc999/RegionRestrictionCheck/main/check.sh)
        elif [ "$character5" = "2" ]; then
            wget -O nf https://github.com/sjlleo/netflix-verify/releases/download/2.5/nf_2.5_linux_amd64 && chmod +x nf && clear && ./nf
    	elif [ "$character5" = "0" ]; then
    	        source /var/1/1.sh
    	else
    	    echo 输入不符合要求
    	fi
    ;;
    0 )
    	source /var/1/1.sh
    ;;
    * )
      clear
      esac