# If not running interactively, don't do anything
[[ $- != *i* ]] && return

smartclear() {
    line_count=$(tput lines)
    if [[ $line_count -lt 45 ]]
    then
        \clear
    else
        \clear && 
        fastfetch -s "OS:Kernel:Packages:Separator:Display:GPU:WM:Separator:Terminal:Shell:Separator:Host:CPU:Disk:Memory:Break:Colors"
    fi
}

[[ $(tty) != /dev/tty* ]] && smartclear
[[ $(tty) != /dev/tty* ]] && PS1='[\[\e[1;36m\]\u@\h\[\e[39;49m\]]\[\e[1;36m\]$\[\e[39;49m\] '
[[ $(tty) != /dev/tty* ]] && alias ls="exa --color=auto --group-directories-first"
[[ $(tty) != /dev/tty* ]] && alias ll="exa -aalr --color=auto --group-directories-first"
stty -ixon # Discard using ctrl+s for freeze
tabs -4

PATH=~/.local/bin:~/scripts/:$PATH

alias clear='smartclear'
alias notes='cd ~/repos/notes/ && git pull && ls'
alias grep='grep --color=auto'
alias info='info --vi-keys'
alias ranger='. ranger'

alias vim='nvim'
alias svim='sudo nvim'

#alias clear='clear && fastfetch'
#alias clean='\clear'

alias sbrc='source ~/.bashrc'
alias brc='vim ~/.bashrc'
alias irc='vim ~/.inputrc'
alias xrc='vim ~/.xinitrc'
alias vrc='cd ~/.config/nvim/ && ls'

alias rm='trash-put'
alias cp='cp -i'
alias mv='mv -i'

assh () {
    eval "$(ssh-agent)"
    ssh-add ~/.ssh/id_rsa
}

glone() {
    ret="git clone git@github.com:$1.git"
    eval "$ret"
}

zat() {
    ret="nohup zathura $1 >&/dev/null &"
    eval "$ret"
}


