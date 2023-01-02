#!/bin/bash
docker version
if [ "$?" = "0" ]; then
    ARCH=$(uname -m) && [[ "${ARCH}" == "armv7l" ]] && ARCH="armv7"
    sudo mkdir -p /usr/local/lib/docker/cli-plugins
    sudo curl -SL "https://github.com/docker/compose/releases/latest/download/docker-compose-linux-${ARCH}" -o /usr/local/lib/docker/cli-plugins/docker-compose
    sudo chmod +x /usr/local/lib/docker/cli-plugins/docker-compose
  else
    echo " 需要在docker-compose环境中运行，正在安装docker，安装完毕请再次运行本程序"
    source /var/1/docker/docker.sh
  fi

