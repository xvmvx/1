#!/bin/bash

echo "检查Docker是否已安装……"
docker -v
if [ $? -ne  0 ]; then
	echo -n "检测到Docker未安装！现在安装？确定请按 y 取消 n >>>>"
  read character
  if [ "$character" = "y" ]; then
    s
  else
    exit 1
  fi
else
	echo "docker 已安装！"
fi
docker-compose version
if [ $? -ne  0 ]; then
	echo -n "检测到Docker未安装！现在安装？确定请按 y 取消 n >>>>"
  read character
  if [ "$character" = "y" ]; then
    s
  else
    exit 1
  fi
else
	echo "docker 已安装！"
fi
