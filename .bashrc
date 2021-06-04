#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias la='ls -la'
alias vim='nvim'
alias locate='plocate'
alias p='sudo pacman'

(cat ~/.cache/wal/sequences &)
source ~/.cache/wal/colors-tty.sh

LF_ICONS=$(sed ~/.config/core/diricons \
            -e '/^[ \t]*#/d'      \
            -e '/^[ \t]*$/d'      \
            -e 's/[ \t]\+/=/g'    \
            -e 's/$/ /')
LF_ICONS=${LF_ICONS//$'\n'/:}
export LF_ICONS

export TERMINAL=/usr/local/bin/st
export BROWSER=/usr/bin/brave
export PATH="${PATH}:${HOME}/.local/bin/"

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	exec startx
fi
