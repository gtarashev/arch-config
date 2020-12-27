#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
# lbracket="\e[1;31m[\e[m"
# rbracket="\e[1;31m]\e[m"
# user="\e[1;33m\u\e[m"
# @="\e[1;32m@\e[m"
# host="\e[0;35m\h\e[m"
# $="\e[0;38m\$\e[m"
PS1='\u@\h \W \$ '


# .:: POWERLINE SHELL STYLE ::. 
# function _update_ps1() {
#     PS1=$(powerline-shell $?)
#   }
# 
# if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
#       PROMPT_COMMAND=#_update_ps1; $PROMPT_COMMAND"
# fi

# .:: ALIASES ::. 
# colourful ls
alias ls="exa"

# manmenu
alias manmenu="Scripts/manmenu"
alias myip="curl ipinfo.io/ip"
alias play="mpv \"\$(xclip -o)\""
