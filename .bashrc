# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

[[ $(tty) != /dev/tty* ]] && PS1='[\[\e[1;36m\]\u@\h\[\e[39;49m\]]\[\e[1;36m\]$\[\e[39;49m\] '
stty -ixon # Discard using ctrl+s for freeze
tabs -4

PATH=~/.local/bin:~/scripts/:$PATH

alias dot='git --git-dir=$HOME/.config/dotfiles --work-tree=$HOME'
alias ls='ls --color=auto --group-directories-first'
alias ll='ls -aalr --color=auto --group-directories-first'
alias grep='grep --color=auto'
alias info='info --vi-keys'
alias ranger='. ranger'

alias vim='nvim'
alias svim='sudo nvim'

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


