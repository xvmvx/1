#!/bin/bash
curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | \
      sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null && \
      echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | \
      sudo tee /etc/apt/sources.list.d/ngrok.list && \
      sudo apt update && sudo apt install ngrok
ngrok config add-authtoken 2JPs2aZjH2mF2n57lYiz6AiMTQZ_3wd7YQMLpFcE9LkkSt4Ri && echo "安装成功"
if { $? = "0" } then
  read "输入要转发的端口号，查看结果中的映射地址>>>>>>>>>>>>>>" portIN
  echo -n "ngrok http"; echo ${portIN}
else
  echo "安装失败，自行检查！！！！！！！  "
fi
