#!/bin/bash
alias gofind = "find / -name" # + “查询名“
alias xitonggo="cat /etc/redhat-release" # 查询系统
alias goport = "netstat -tln | grep" # + 端口值
alias pago = "netstat -atu" #全部
alias pugo = "netstat -nupl" #全部UDP
alias ptgo = "netstat -ntpl" #全部TCP
echo "alias mls='ls /'" >> ~/.bashrc
alias redgo='\E[1;31m'  
alias yellowgo='\E[1;33m' 
alias bkuego='\E[1;34m'  
alias zigo = '\033[45;30m'
alias shango ='"\033[47;30;5m '
alias 0go='\E[0m'





# 文件 
alias l.= 'ls -d . .. .git .gitignore .gitmodules .travis.yml --color=auto'
alias ls= 'ls --color=auto'
alias ll= 'ls --color -al'
alias ..= 'cd ..'
alias ...='cd ../..'
alias c="clear"
# 创建并进入
gomcd() { mkdir -p "$1"; cd "$1";}
# 进入并打开
gocls() { cd "$1"; ls;}
# 备份
goback() { cp "$1"{,.bak};}
# 解压
gotra() {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}







alias frpsgo = ' systemctl start frps'
alias frps+go = ' each 
#需要使用echo -e
echo -e  "${RED_COLOR}===david say red color===${RESET}"
echo -e  "${YELOW_COLOR}===david say yelow color===${RESET}"
echo -e  "${BLUE_COLOR}===david say green color===${RESET}"
#生产力 

# grep 纯文本文件中搜索匹配正则表达式
alias ggo='grep --color=auto'
alias eggo = 'egrep --color=auto'
alias fggo = 'fgrep --color=auto'

gomd5() { md5sum "$1" | grep "$2";}
alias makescript="fc -rnl | head -1 >"
# 强密码
alias psdgo="strings /dev/urandom | grep -o '[[:alnum:]]' | head -n 30 | tr -d '\n'; echo"
# 历史
alias histggo="history | grep"



#系统信息 
# 磁盘信息
alias cmtgo="mount | column -t"
# 树状文件
alias trego="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"
# 文件位置？？？
gosbs(){ du -b --max-depth 1 | sort -nr | perl -pe 's{([0-9]+)}{sprintf "%.1f%s", $1>=2**30? ($1/2**30, "G"): $1>=2**20? ($1/2**20, "M"): $1>=2**10? ($1/2**10, "K"): ($1, "")}e';}
# 接管某个进程的标准输出和标准错误。注意你需要安装了 strace。？？？
alias intercept="sudo strace -ff -e trace=write -e write=1,2 -p"
# 剩余内存
alias memgo='free -m -l -t'
# 进程ID
alias pidgo="ps aux | grep"
# 音量？？？？
alias volume="amixer get Master | sed '1,4 d' | cut -d [ -f 2 | cut -d ] -f 1"

#Network
# 扒站 
alias goweb="wget --random-wait -r -p -e robots=off -U mozilla"
# 连接到网络的进程
alias netgo="lsof -P -i -n"
# 活动端口
alias port1go='netstat -tulanp'

gmail() { curl -u "$1" --silent "https://mail.google.com/mail/feed/atom" | sed -e 's/<\/fullcount.*/\n/' | sed -e 's/.*fullcount>//'}
# 公网IP地址和主机名
alias ipingo="curl ifconfig.me && curl ifconfig.me/host"
# IP地址的地理位置
goipl() { lynx -dump http://www.ip-adress.com/ip_tracer/?QRY=$1|grep address|egrep 'city|state|country'|awk '{print $3,$4,$5,$6,$7,$8}'|sed 's\ip address flag \\'|sed 's\My\\';}

#Funny
kernelgraph() { lsmod | perl -e 'print "digraph \"lsmod\" {";<>;while(<>){@_=split/\s+/; print "\"$_[0]\" -> \"$_\"\n" for split/,/,$_[3]}print "}"' | dot -Tpng | display -;}
alias busy="cat /dev/urandom | hexdump -C | grep \"ca fe\""
