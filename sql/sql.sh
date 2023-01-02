#!/bin/bash
red(){
    echo -e "\033[31m\033[01m$1\033[0m"
}
green(){
    echo -e "\033[32m\033[01m$1\033[0m"
}
yellow(){
    echo -e "\033[33m\033[01m$1\033[0m"
}
blue(){
    echo -e "\033[34m\033[01m$1\033[0m"
}
IP1=$(curl ip.sb)
IP2=$(ip route get 1 | awk '{print $7;exit}')
MYFILE="/docker/sql/"
MYPORT="54320"
MYNAME="goodway"
MYUSER="goodway"
MYPASSWORD="Guwei888"
 	if [! -d "/docker/sql/" ]; then
           mkdir -p /docker/sql/  || mkdir /docker; cd /docker && mkdir /docker/sql/ 
        fi
        echo "将安装到 /docker/sql文件夹内，确定按  y，按其他键重新输入安装位置"
        read -p ">>>>>>>>>>>>>>>>" character
        if [ "$character" = "y" ]; then
           cd /docker/sql/
        else
            read -p "输入完整的文件路径：" file1
            MYFILE=file1
            cd file1 || echo '文件夹不正确'
        fi
        chmod -R 777 /docker/sql
logo1="$(tput setaf 6)
    ▄▄▄▄                             ▄▄ ▄▄      ▄▄                    
  ██▀▀▀▀█                            ██ ██      ██                    
 ██         ▄████▄    ▄████▄    ▄███▄██ ▀█▄ ██ ▄█▀  ▄█████▄  ▀██  ███ 
 ██  ▄▄▄▄  ██▀  ▀██  ██▀  ▀██  ██▀  ▀██  ██ ██ ██   ▀ ▄▄▄██   ██▄ ██  
 ██  ▀▀██  ██    ██  ██    ██  ██    ██  ███▀▀███  ▄██▀▀▀██    ████▀  
  ██▄▄▄██  ▀██▄▄██▀  ▀██▄▄██▀  ▀██▄▄███  ███  ███  ██▄▄▄███     ███   
    ▀▀▀▀     ▀▀▀▀      ▀▀▀▀      ▀▀▀ ▀▀  ▀▀▀  ▀▀▀   ▀▀▀▀ ▀▀     ██    
                                                              ███     
$(tput sgr0)"


yellow "${logo1}"
red "########################################"
blue "-----  Good way  道之 SQL   -----"
blue "-----本机公网IP是："; green "${IP1}"
blue "-----本机内网IP是："; green "${IP2}"
red "########################################"
echo ' '
echo ' '
echo ' '
blue "本脚本用于安装数据库："
green "----- 1.MySQL"
green "----- 2.PostgreSQL"
green "----- 3.MariaDB"
echo "选择对应编号及适合的类型，开始安装吧......"
read -p "退出输入“0”   >>>>>       " menuNumberInput
 case "$menuNumberInput" in
    1 )
        MYPORT=53306
        mkdir -p /docker/sql/{db,data,log}
        chmod -R 777 /docker/sql
        
        
        cat >>docker-compose.yml<<EOF
        version: '3'
          services:
            db:
              image: mysql:5.7.38
              container_name: mysql
              volumes:
                - ./db:/var/lib/mysql
              restart: always
              environment:
                MYSQL_ROOT_PASSWORD: 'Guwei888'
              expose:
                - 3306
              ports:
                - 53306:3306

            phpmyadmin:
              depends_on:
                - db
              image: phpmyadmin:5.2.0
              container_name: pma
              restart: always
              working_dir:
                /pma
              ports:
                - 62:80
              environment:
                - PMA_PORT=53306
        EOF
    ;;
    2 )
        MYPORT=54320
        mkdir -p /docker/sql/{local_pgdata,pgadmin-data}
        chmod -R 777 /docker/sql
        cat >>docker-compose.yml<<EOF
        #  版本
        version: "3"
        # 服务
        services:
          # 服务1 
          db:
            # 镜像
            image: postgres
            # 容器名称
            container_name: local_pgdb
            # 守护程序重新启动时的操作
            restart: always
            # 主机和容器端口 主机:54320 容器:5432 外露:54320
            ports:
              - "54320:5432"
            # 环境变量
            environment:
              # 用户名称
              POSTGRES_USER: goodway
              # 密码
              POSTGRES_PASSWORD: Guwei888
            # 将文件夹从主机挂载到容器 :前面是主机,后面是容器
            volumes:
              - ./local_pgdata:/var/lib/postgresql/data
          # 服务2
          pgadmin:
            image: dpage/pgadmin4
            container_name: pgadmin4_container
            restart: always
            ports:
              - "62:80"
            environment:
              PGADMIN_DEFAULT_EMAIL: goodway5898@gmail.com
              PGADMIN_DEFAULT_PASSWORD: Guwei888
            volumes:
              - ./pgadmin-data:/var/lib/pgadmin

        volumes:
          local_pgdata:
          pgadmin-data:
        EOF
    ;;
    3 ) 
      MYPORT=53306
      MYNAME="goodway"
      docker run --detach --name ${MYNAME} --env MARIADB_USER=example-user --env MARIADB_PASSWORD=my_cool_secret --env MARIADB_ROOT_PASSWORD=my-secret-pw  mariadb:latest
      mkdir -p /docker/mariadb/{config,data,log}
      chmod -R 777 /docker/mariadb
      cat >>docker-compose.yml<<EOF
        version: '3.1'
        services:
          mariadb:
            image: mariadb:10.5.5
            container_name: "mariadb1"
            restart: always
            environment:
              MYSQL_USER: "goodway"
              MYSQL_PASSWORD: "Guwei888"
              MYSQL_ROOT_PASSWORD: "Guwei888"
              TZ: "Asia/Shanghai"
            ports:
              - "53306:3306"
            volumes:
              - ./data:/var/lib/mysql
              - ./log:/var/log/mysql
              - ./conf/my.cnf:/etc/mysql/my.cnf
        EOF
        docker exec -it mariadb1 bash
        cp /etc/mysql/my.cnf 到 /docker/mariadb/conf/my.cnf
    ;;
        blue "数据库默认信息："
        blue "数据库名称："; green "${MYNAME}"
        blue "数据库链接："; green "${MYUSER}"
        blue "数据库端口："; green "${MYPORT}"
        blue "数据库用户名："; green "${MYUSER}"
        blue "数据库密码："; green "${MYPASSWORD}"
        echo "开始安装............."
        docker-compose up -d
        
