[Vim配置及使用技巧](https://www.cnblogs.com/vachester/p/5659648.html)<br>
[vundle: vim插件管理安装之错误总结](https://blog.csdn.net/u013475704/article/details/52295157)<br>
# 1、下载vim插件管理器
    `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
    如果目录.vim/bundle不存在请先创建
# 2、安装AStyle；<br>
# 3、安装ctags；<br>
## 另外，附上vim环境中其他较为好用的快捷键<br>
        * 定位至当前光光标所指单词的下一次出现的地方<br>
        # 定位至当前光光标所指单词的上一次出现的地方<br>
        n 定位至跳至已被标记出的单词下一次出现的地方<br>
        N 定位至跳至已被标记出的单词上一次出现的地方<br>
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
    `ctags --fields=+iaSl --extra=+q -R -f ~/.vim/systags /usr/include /usr/local/include`
    `ctags -R -I --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q`
# 4、安装命令行ag
    `apt-get install silversearcher-ag`
