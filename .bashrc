#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '


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
