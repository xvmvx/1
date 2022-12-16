#!/bin/bash
sudo -i
if [ "$?" = "0" ]; then
  echo "欢迎你！！！"
else
  su root 
  apt install sudo git wget vim || yum install sudo git wget vim
  sudo -i
fi
FILE=/var/1
if [ -e "$FILE" ]; then
    echo "$FILE 已经存在，是否更新？"
    read -p ">>>>>>>>>>>>>>>>" character
      if [ "$character" = "y" ]; then
        sudo rm -rf /var/1 && git clone https://github.com/xvmvx/1.git /var/1
      elif [ "$character" = "n" ]; then
        chmod +x /var/1/* && source /var/1/1.sh
      fi
fi

