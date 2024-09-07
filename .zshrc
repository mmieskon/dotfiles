alias fastfetch='[ -z "${TMUX}" ] && clear && fastfetch --logo ~/Downloads/rick2.png --logo-padding-left 2'
clear && fastfetch
# [ -z "${TMUX}" ] && clear && fastfetch --logo ~/Downloads/rick2.png --logo-padding-left 2

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
#zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

### Mods

export EDITOR='nvim'
export SHELL='zsh'

set -o noclobber

bindkey -v
bindkey "^H" backward-delete-char
bindkey "^?" backward-delete-char
# Ctrl-w - delete a full WORD (including colon, dot, comma, quotes...)
my-backward-kill-word () {
# Add colon, comma, single/double quotes to word chars
# local WORDCHARS='?_~=&;!#$%^,"'"'"
local WORDCHARS='_'
zle -f kill # Append to the kill ring on subsequent kills.
zle backward-kill-word
}
zle -N my-backward-kill-word
bindkey '^w' my-backward-kill-word

bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward

export PATH=$HOME/scripts:$HOME/.local/bin:$HOME/.cargo/bin/:$PATH

alias mux='tmuxinator'
alias ls='ls --color=auto --group-directories-first'
alias ll='ls -aalr --color=auto --group-directories-first'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias vim='nvim'
alias rm='trash-put'
alias cp='cp -i'
alias mv='mv -i'
alias treeh='rg --files | tree --fromfile'

zat() {
    ret="nohup zathura $1 >&/dev/null &"
    eval "$ret"
}

scroll-and-clear-screen() {
    printf '\n%.0s' {1..$LINES}
    zle clear-screen
    echo
    ls
    echo -e "\n"
    zle reset-prompt
}
zle -N scroll-and-clear-screen
bindkey '^l' scroll-and-clear-screen

# Plugins installed with zplug
ZPLUG_INIT_PATH='/usr/share/zplug/init.zsh'
if [ -f $ZPLUG_INIT_PATH ]
then
    source $ZPLUG_INIT_PATH

    if ! zplug check --verbose; then
        printf "Install? [y/N]: "
        if read -q; then
            echo; zplug install
        fi
    fi

    zplug romkatv/powerlevel10k, as:theme, depth:1

    zplug load
else
    echo "$ZPLUG_INIT_PATH does not exist. Did you install zplug?"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

