#!/bin/bash

echo "检查Docker是否已安装……"
docker -v
if [ $? -ne  0 ]; then
    echo -n "检测到Docker未安装！现在安装？确定请按 y 取消 n >>>>"
    read character
    if [ "$character" = "y" ]; then
        source /var/1/docker/d.sh
    else
        docker-compose version
    	if [ $? -ne  0 ]; then
            echo -n "检测到Docker-compose未安装！现在安装？确定请按 y 取消 n >>>>"
            read character1
            if [ "$character1" = "y" ]; then
                source /var/1/docker/d.sh
            else
              exit 1
  	    fi
	else
	    echo "docker-compose 已安装！"
        fi
    else
        exit 1
    fi
else
    echo "docker 已安装！"
fi
