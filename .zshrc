alias c='code'
alias n='nvim'
alias vim='nvim'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -al'
alias tas='tmux attach-session -t'
alias tns='tmux new-session -t'
alias t='tmux kill-session -t'
alias tls='tmux ls'
alias k='kubectl'
alias gst='git status'
alias ga='git add'
alias gc='git commit'
alias cl='clear'

export PATH=$PATH:/usr/local/go/bin

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

eval "$(starship init zsh)"
