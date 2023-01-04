export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="alexxi"

plugins=(
	git
        zsh-autosuggestions
        vi-mode
        #zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# ALEX
export PATH
export PATH="/Users/alexxi/go/bin:$PATH"
export PATH="/Users/alexxi/.local/scripts:$PATH"
export GOARCH="arm64"
export GOOS="darwin"
export GOPATH="/Users/alexxi/go"
unset GOBIN
#export GOBIN="$GOPATH/bin"
export LUA_PATH=""
export LUA_PATH="$LUA_PATH;/Users/alexxi/.config/nvim/?/init.lua"
export LUA_PATH="$LUA_PATH;/Users/alexxi/.config/nvim/?.lua"
export LSCOLORS="exgxcxdxbxegedabagacad"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/alexxi/opt/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/alexxi/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/alexxi/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/alexxi/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

bindkey -s ^f "tmux-sessionizer-full\n"
KEYTIMEOUT=5

alias k="kubectl"
alias envd="~/Desktop/CS/envd/bin/envd"
alias l="ls -CF"
alias t='tmux attach || tmux new-session'
alias ta="tmux attach -t"
alias td="tmux kill-session -t"
alias tn="tmux new -t"
alias tl='tmux list-sessions'
alias ts='tmux-switch-sessions'
alias ll='ls -l -a'
alias zshconfig="nvim ~/.zshrc"
alias ide="nvim ." 

eval "$(thefuck --alias)"
eval "$(jump shell)"
#eval "$(starship init zsh)"

export VI_MODE_SET_CURSOR=true
