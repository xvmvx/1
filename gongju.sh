#!/bin/bash
echo "----------          My goodway           -------- "
echo "##################################################"
echo "----- 按1 运行行超级工具箱（好像坏了）"
echo "----- 按2 运行综合工具箱"
echo "----- 按3 运行彩色BASH工具 "
echo "----- 按4 运行中文BASH圣经"
echo "----- 按5 运行40个脚本主题"
echo "----- 按0 返回上层"
echo "=================================================="
echo " "
echo " "
echo "请选择要执行的操作，退出直接回车即可"
read -p ">>>>>>>>>>>>>>>>" menuNumberInput11
  case "$menuNumberInput11" in
    1 )
      	wget -O box.sh https://raw.githubusercontent.com/BlueSkyXN/SKY-BOX/main/box.sh && chmod +x box.sh && clear && ./box.sh
    ;;
    2 )
        if ! which wget 2>&1 &>/dev/null || ! which unzip 2>&1 &>/dev/null ;then
            echo '需要安装： wget 和 unzip 进行下载和解压！'
            exit 1
        fi
        if [ ! -d "shell-master" ];then
            wget --no-check-certificate -O master.zip https://github.com/ttlxihuan/shell/archive/master.zip
            if [ $? != '0' ];then
                echo '下载脚本包失败！'
                exit 1
            fi
            unzip master.zip
        fi
        cd shell-master
        find ./ -maxdepth 3 ! -path '*/temp/*' -type f -exec sed -i 's/\r//' {} \;
        for NAME in ${@:1}; do
            nohup bash run.sh $NAME 2>&1 &> ../$NAME.log &
        done
        exit 0
    ;;
    3 )
        echo "macOS 或 Linux 可用：   brew install gum"
        echo "Arch Linux (btw) 可用：  pacman -S gum"
        echo "Nix   可用：  nix-env -iA nixpkgs.gum"
        echo "Debian/Ubuntu   可用：  
              echo 'deb [trusted=yes] https://repo.charm.sh/apt/ /' | sudo tee /etc/apt/sources.list.d/charm.list
              sudo apt update && sudo apt install gum "
        echo "Fedora 可用：  
              echo '[charm]
              name=Charm
              baseurl=https://repo.charm.sh/yum/
              enabled=1
              gpgcheck=0' | sudo tee /etc/yum.repos.d/charm.repo
              sudo yum install gum "
        echo 'deb [trusted=yes] https://repo.charm.sh/apt/ /' | sudo tee /etc/apt/sources.list.d/charm.list
        sudo apt update && sudo apt install gum
    ;;
    4 )
        git clone https://github.com/xvmvx/505_pure-bash-bible-zh_CN.git
        cd 505_pure-bash-bible-zh_CN
        echo "查看并运行即可"
    ;;
    5 )
        source /var/1/40.sh
    ;;
    0 )
        source /var/1/1.sh
    ;;
    * )
        clear
        esac
