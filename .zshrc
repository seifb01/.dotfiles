export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="awesomepanda"

plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

alias c='code'
alias n='nvim'
alias vim='nvim'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -al'
alias tas='tmux attach-session -t'
alias tns='tmux new-session -t'
alias tks='tmux kill-session -t'
alias tls='tmux ls'
alias k='kubectl'
alias gst='git status'
alias ga='git add'
alias gc='git commit'

source <(kubectl completion zsh)
export PATH=$PATH:/usr/local/go/bin

if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi
