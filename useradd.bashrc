############################user add start######################################

#git config提示及颜色配置
if [ -f ~/.git-completion.bash ]; then
    source ~/.git-completion.bash
fi
if [ -f ~/.git-prompt.sh ]; then
    source ~/.git-prompt.sh
fi
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM="verbose git svn"
PS1='\[\033[1;32m\]\u@\h \[\033[1;34m\]\W\[\033[1;31m\]$(__git_ps1 " (%s)")\[\033[1;35m\] $ \[\033[0m\]'

############################for tmux########################################
#解决tmux中vi颜色和外面shell中的不一致
alias tmux='tmux -2'

tmux_init()
{
    tmux new-session -s "yzx" -d -n "source"    # 开启一个会话
    tmux new-window -n "compile"                # 开启一个窗口
    tmux new-window -n "temp"                   # 开启一个窗口
    #tmux split-window -h                        # 开启一个竖屏
    #tmux split-window -v "top"                  # 开启一个横屏,并执行top命令
    tmux -2 attach-session -d                   # tmux -2强制启用256color，连接已开启的tmux
}
# 判断是否已有开启的tmux会话，没有则开启
if which tmux 2>&1 >/dev/null; then
    test -z "$TMUX" && (tmux attach || tmux_init)
fi

#中文man手册重命名及man手册颜色提示
alias cman='man -M /usr/local/zhman/share/man/zh_CN' 
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

#for colordiff
alias cdiff='colordiff'
alias ll='ls -alF --color=auto'

