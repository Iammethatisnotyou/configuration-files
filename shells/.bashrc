# .bashrc

#Control backspace
#stty werase ^H
PS1='[\u@\h \W]\$ '

export EDITOR='nvim'
export VISUAL='nvim'
bind '"\C-h": backward-kill-word'

alias start='startx > /dev/null 2>&1'

alias g20='g++ -std=c++20 -o'
alias gcpp='g++ -std=c++17 -o'

alias cmus='/usr/local/bin/cmus'

alias t='touch'
alias steam='flatpak run com.valvesoftware.Steam > /dev/null 2>&1'
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

alias fzn='fzf | xargs -r nvim'
alias fzh='fzf | xargs -r feh'
#alias fcd='fzf | xargs -r cd'
fcd() { cd "$(find . -type d | fzf)"; }


[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
	PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
    	if [ -f "$rc" ]; then
        	. "$rc"
    	fi
	done
fi
unset rc
