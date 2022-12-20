#!/bin/bash
set e
logo="$(tput setaf 1)
   ____                 ___        __
  / ___| ___   ___   __| \ \      / /_ _ _   _ 
 | |  _ / _ \ / _ \ / _` |\ \ /\ / / _` | | | |
 | |_| | (_) | (_) | (_| | \ V  V / (_| | |_| |
  \____|\___/ \___/ \__,_|  \_/\_/ \__,_|\__, |
                                         |___/ 
$(tput sgr0)"
echo "${logo}";

dan= "$(tput setaf 2)
------------------
$(tput sgr0)"

shuang= "$(tput setaf 4)
==================================================
$(tput sgr0)"

jian= "$(tput setaf 5)
>>>>>>>>>>>>>>>>>>>
$(tput sgr0)"

jing= "$(tput setaf 3)
##################################################
$(tput sgr0)"

echo "${jing}"
echo "${shuang}"
echo -n "${dan}";echo -n "查看命令";echo "${dan}"
echo "${shuang}"
echo "----- 1.系统"
echo "----- 2.硬盘"
echo "----- 3.分区"
echo "----- 4.网络"
echo "----- 5.进程"
echo "----- 6.用户"
echo "----- 7.服务"
echo "----- 8.程序"
echo " "
echo "请选择要执行的操作，退出直接回车即可"
read -p "${jian}" menuNumberInput
  case "$menuNumberInput" in
    1 )
        echo "1.查看内核/操作系统/CPU信息"
        echo "2.查看操作系统版本"
        echo "3.查看CPU信息"
        echo "4.查看计算机名 "
        echo "5.列出所有PCI设备 "
        echo "6.列出所有USB设备 "
        echo "7.列出加载的内核模块 "
        echo "8.查看环境变量 "
        echo "请选择要执行的操作，返回0号键。退出直接回车即可"
        read -p ">>>>>>>>>>>>>>>>" systemInput
          case "$systemInput" in
          1 )
            uname -a
          ;;
          2 )
            head -n 1 /etc/issue
          ;;
          3 )
            cat /proc/cpuinfo
          ;;
          4 )
            hostname
          ;;
          5 )
            lspci -tv
          ;;
          6)
            lsusb -tv
          ;;
          7 )
            lsmod
          ;;
          8 )
           env
          ;;
          0 )
            source /var/1.sh
          ;;
          * )
            clear
            esac
    ;;
    2 )
        echo "1.查看内存使用量和交换区使用量"
        echo "2.查看各分区使用情况 "
        echo "3.查看指定目录的大小 "
        echo "4.查看内存总量 "
        echo "5.查看空闲内存量 "
        echo "6.查看系统运行时间、用户数、负载 "
        echo "7.查看系统负载 "
        echo "请选择要执行的操作，返回0号键。退出直接回车即可"
        read -p ">>>>>>>>>>>>>>>>" neicunInput
        case "neicunInput" in
        1 )
         free -m
        ;;
        2 )
           df -h
        ;;
        3 )
           du -sh
        ;;
        4 )
           grep MemTotal /proc/meminfo
        ;;
        5 )
           grep MemFree /proc/meminfo
        ;;
        6 )
           uptime
        ;;
        7 )
           cat /proc/loadavg
        ;;
        0 )
          source /var/1.sh
        ;;
        * )
          clear
          esac
    ;;
    3 )
    	echo "1.查看挂接的分区状态"
    	echo "2.查看所有分区 "
    	echo "3.查看所有交换分区 "
    	echo "4.查看磁盘参数(仅适用于IDE设备) "
    	echo "5.查看启动时IDE设备检测状况"
        echo "请选择要执行的操作，返回0号键。退出直接回车即可"
    	read -p ">>>>>>>>>>>>>>>>" fenquInput
    	case "fenquInput" in
    	1 )
    	  mount | column -t
    	;;
    	2 )
    	   fdisk -l
    	;;
    	3 )
    	   swapon -s
    	;;
    	4 )
    	   hdparm -i /dev/hda
    	;;
    	5 )
    	   dmesg | grep IDE
        ;;
    	0 )
    	  source /var/1.sh
    	;;
    	* )
    	  clear
    	  esac
    ;;
    4 )
    	echo "1.查看所有网络接口的属性"
    	echo "2.查看防火墙设置 "
    	echo "3.查看路由表 "
    	echo "4.查看所有监听端口 "
    	echo "5.查看所有已经建立的连接 "
    	echo "6.查看网络统计信息 "
        echo "请选择要执行的操作，返回0号键。退出直接回车即可"
        read -p ">>>>>>>>>>>>>>>>" fenquInput
        case "fenquInput" in
        1 )
          ifconfig 
        ;;
        2 )
           iptables -L
        ;;
        3 )
           route -n;;
        4 )
           netstat -lntp
        ;;
        5 )
           netstat -antp
        ;;
        6 )
           netstat -s
        ;;
        0 )
          source /var/1.sh
        ;;
        * )
          clear
          esac
    ;;
    5 )
        echo "1.查看所有进程 "
        echo "2.实时显示进程状态"
        echo "请选择要执行的操作，返回0号键。退出直接回车即可"
        read -p ">>>>>>>>>>>>>>>>" jinInput
        case "jinInput" in
        1 )
          ps -ef
        ;;
        2 )
           top
        ;;
        0 )
            source /var/1.sh
        ;;
        * )
            clear
            esac
    ;;
    6 )
        echo "1.查看活动用户"
        echo "2.查看指定用户信息"
        echo "3.查看用户登录日志"
        echo "4.查看系统所有用户"
        echo "5.查看系统所有组"
        echo "6.查看当前用户的计划任务"
        echo "请选择要执行的操作，返回0号键。退出直接回车即可"
        read -p ">>>>>>>>>>>>>>>>" fenquInput
        case "fenquInput"
        1 )
          w 
        ;;
        2 )
           id <用户名> # 查看指定用户信息
        ;;
        3 )
           last
        ;;
        4 )
           cut -d: -f1 /etc/passwd
        ;;
        5 )
           cut -d: -f1 /etc/group
        ;;
        6 )
           crontab -l
        ;;
        0 )
          source /var/1.sh
        ;;
        * )
          clear
          esac
    ;;
    7 )
        echo "1.列出所有系统服务 "
        echo "2.列出所有启动的系统服务 "
        echo "请选择要执行的操作，返回0号键。退出直接回车即可"
        read -p ">>>>>>>>>>>>>>>>" fuwuInput
        case "fuwuInput" in
        1 )
          chkconfig –list
        ;;
        2 )
           chkconfig –list | grep on
        ;;
        0 )
            source /var/1.sh
        ;;
        * )
            clear
            esac
    ;;
    8 )
        echo "查看所有安装的软件包"
        rpm -qa
    ;;
    0 )
          source /var/1.sh
    ;;
        * )
          clear
          esac
