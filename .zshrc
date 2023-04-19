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
export PATH="/Applications/CMake.app/Contents/bin:$PATH"
export GOARCH="arm64"
export GOOS="darwin"
export GOPATH="/Users/alexxi/go"
unset GOBIN
#export GOBIN="$GOPATH/bin"
export LUA_PATH=""
export LUA_PATH="$LUA_PATH;/Users/alexxi/.config/nvim/?/init.lua"
export LUA_PATH="$LUA_PATH;/Users/alexxi/.config/nvim/?.lua"
export LSCOLORS="exgxcxdxbxegedabagacad"

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
alias python="python3.10"
alias python3="python3.10"
alias bst='ssh axi@172.18.16.101'
alias pip='pip3'

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
eval "$(thefuck --alias)"
#eval "$(starship init zsh)"

export VI_MODE_SET_CURSOR=true

# source <(kubectl completion zsh)  # set up autocomplete in zsh into the current shell
# echo '[[ $commands[kubectl] ]] && source <(kubectl completion zsh)' >> ~/.zshrc # add autocomplete permanently to your zsh shell

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/alexxi/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
