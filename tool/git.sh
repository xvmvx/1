#!/bin/bash
git init 1 && cd 1     //新建仓库并进入文件夹
git config core.sparsecheckout true //设置允许克隆子目录
read -p "输入你要下载的文件名>>>>>>>>" name
echo '${name}' >> .git/info/sparse-checkout //设置要克隆的仓库的子目录路径   //空格别漏

git remote add origin xvmvx@github.com:xvmvx/1.git  //这里换成你要克隆的项目和库

git pull origin master 
