alias ...='cd ../..'
alias cd~='cd ~'
alias cc='cd /'
alias dc='docker-compose up -d'
alias dv='vim docker-compose.yml'
b() { iptables -I INPUT -s "$1"; -j DROP;}
alias cdd='cd /docker; ls;'   # 进入并打开
c() { cd "$1"; ls;}   # 进入并打开
m() { mkdir -p "$1"; cd "$1";}  # 创建并进入
alias dps='docker ps'
alias ds='docker stop'
alias dr='docker rm'
alias di='docker images'
alias dri='docker rmi'
alias salias='source ~/.bashrc'
alias valias='vim ~/.bashrc'
alias upda='sudo apt-get update && sudo apt-get upgrade'
# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
#if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
#    . /etc/bash_completion
#fi
