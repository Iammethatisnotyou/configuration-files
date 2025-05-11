# Created by newuser for 5.9
autoload -U colors && colors
#PS1="%F{cyan}%fLiamUSR-%c > "
#PS1="%{$fg[green]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}% "
PS1="%{$fg[green]%}%n%{$reset_color%}%{$fg[yellow]%}@%{$fg[blue]%}%m %{$fg[blue]%}%~ %{$reset_color%}> "

echo -ne "\e[6 q"

set -o emacs

bindkey '^H' backward-kill-word

#seatd-launch ./dwl
export PKG_CONFIG_PATH=/usr/lib/wlroots0.19/pkgconfig/
#export LD_LIBRARY_PATH=$HOME/.local/lib:$LD_LIBRARY_PATH

export EDITOR='nvim'
export VISUAL='nvim'

alias cl='clear && ls'
alias ns='nsxiv'
alias thunderbird='./home/LiamUSR/Apps/thunderbird/thunderbird'
alias start='startx > /dev/null 2>&1'

alias g20='g++ -std=c++20 -o'
alias gcpp='g++ -std=c++17 -o'

alias cmus='/usr/local/bin/cmus'

alias t='touch'
#alias steam='flatpak run com.valvesoftware.Steam > /dev/null 2>&1'
alias pass='python ~/programs/Programs2/password/password.py'
alias specs='/home/LiamUSR/programs/scripts/specs.sh'

alias cls='clear&&ls'
alias l='ls'
alias lsdir='ls -d */'
alias ls='ls --color=auto'
alias ll='ls -lh'
alias ld='ls -d */'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias p='sudo pacman'
alias c='clear'
alias nv='nvim'

# Enable fzf (ensure fzf is installed)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Aliases for fzf and other commands
alias fzn='fzf | xargs -r nvim'
alias fzh='fzf | xargs -r feh'

# fcd: Change directory using fzf
fcd() { cd "$(find . -type d | fzf)"; }

# If you want to source global Zsh settings (for system-wide aliases and functions)
if [ -f /etc/zshrc ]; then
    source /etc/zshrc
fi

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi


source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
