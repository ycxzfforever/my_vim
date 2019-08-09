[Vim配置及使用技巧](https://www.cnblogs.com/vachester/p/5659648.html)<br>
[vundle: vim插件管理安装之错误总结](https://blog.csdn.net/u013475704/article/details/52295157)<br>
# 1、下载vim插件管理器
`git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`<br>
如果目录.vim/bundle不存在请先创建
# 2、安装AStyle
`sudo apt-get install astyle`
# 3、安装ctags
`sudo apt-get install ctags`
## 另外，附上vim环境中其他较为好用的快捷键<br>
        * 定位至当前光光标所指单词的下一次出现的地方
        # 定位至当前光光标所指单词的上一次出现的地方
        n 定位至跳至已被标记出的单词下一次出现的地方
        N 定位至跳至已被标记出的单词上一次出现的地方
```vim
function! UpdateCtags()
    let curdir=getcwd()
    while !filereadable("./tags")
        cd ..
        if getcwd() == "/"
            break
        endif
    endwhile
    if filewritable("./tags")
        !ctags -R -I --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q
    endif
    execute ":cd " . curdir
endfunction
    
    nmap <F10> :call UpdateCtags()<CR>
```
## 添加系统目录tags
系统目录tags：`ctags --fields=+iaSl --extra=+q -R -f ~/.vim/systags /usr/include /usr/local/include`<br>
工程目录tags：`ctags -R -I --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q`<br>
# 4、安装命令行ag
`sudo apt-get install silversearcher-ag`
# 5、下载vimrc.local
`wget https://raw.githubusercontent.com/ycxzfforever/my_vim/master/vimrc.local`<br>
拷贝到vim配置文件夹下`sudo cp vimrc.local /etc/vim/`
如果/etc/vim/vimrc中没有以下代码，请加上
```vim
if filereadable("/etc/vim/vimrc.local")
    source /etc/vim/vimrc.local
endif
```
# 6、安装相应插件
执行`:PluginInstall`后便会自动安装所有插件，时间视网速而定，插件都不大，一般10分钟以内
# 7、安装ack(ubuntu下为ack-grep)
    sudo apt-get install ack-grep
# 8、安装VIM（需vim版本7.4以上，vim --version查看,Ubuntu14.04以后基本上不需要重新安装vim了）
    1、下载vim源码：`wget ftp://ftp.vim.org/pub/vim/unix/vim-7.4.tar.bz2`
    2、解压：tar -xvf vim-7.4.tar.bz2 
    3、安装Python相关：sudo apt-get install python-dev
    4、安装编译环境：apt-get install ncurses-devel 
    5、配置VIM：./configure --with-features=huge --enable-pythoninterp --enable-rubyinterp --enable-luainterp --enable-perlinterp --with-python-config-dir=/usr/lib/python2.7/config/ --enable-gui=gtk2 --enable-cscope --prefix=/usr
    6、make
    7、make install
或者：`sudo aptitude install vim-gnome vim vim-common vim-tiny`
## aptitude类似于apt-get
[ubuntu 安装软件的一些命令aptitude，apt-get](https://blog.csdn.net/u013378306/article/details/70146194)<br>
# 注：解决Linux下git每次都要输入用户名和密码
先cd到根目录，执行`git config --global credential.helper store`命令
# 9、增加tmux.conf
tmux是一个类似于screen终端管理软件，tmux.conf为其配置文件，需要在`$HOME`目录下链接为`.tmux.conf`;
# 10、增加useradd.bashrc
此配置文件为用户增加的环境配置，在`$HOME/.bashrc`中增加
```vim
###################### user add #############################
if [ -f $HOME/my_vim/useradd.bashrc ] ; then
    source $HOME/my_vim/useradd.bashrc
fi
```
