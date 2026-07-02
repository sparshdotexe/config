[[ $- != *i* ]] && return

export EDITOR=nvim
export VISUAL=nvim

shopt -s histappend
export HISTSIZE=10000
export HISTFILESIZE=20000
export HISTCONTROL=ignoredups
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

eval "$(fzf --bash)"
eval "$(starship init bash)"
eval "$(zoxide init bash)"

alias ls='eza -lh --group-directories-first --icons=auto'
alias grep='grep --color=auto'
alias n='nvim'
alias arch='docker start -ai bash'
alias y='yazi'
alias ff='fastfetch'
alias c='clear'
alias rc='nvim ~/.bashrc'
alias src='source ~/.bashrc'
alias run='cargo run'
