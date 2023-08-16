export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="alexxi"

plugins=(
	git
    zsh-autosuggestions
    vi-mode
    kube-ps1
    #zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# ALEX
export PATH
export PATH="/usr/local/go/bin:$PATH"
export PATH="/Users/alexxi/.local/scripts:$PATH"
export PATH="/Applications/CMake.app/Contents/bin:$PATH"
export GOARCH="arm64"
export GOOS="darwin"
export GOPATH="/usr/local/go"
unset GOBIN
#export GOBIN="$GOPATH/bin"
export LUA_PATH=""
export LUA_PATH="$LUA_PATH;/Users/alexxi/.config/nvim/?/init.lua"
export LUA_PATH="$LUA_PATH;/Users/alexxi/.config/nvim/?.lua"
export LSCOLORS="exgxcxdxbxegedabagacad"
export GOOGLE_APPLICATION_CREDENTIALS="/Users/alexxi/pulumi-creds.json"

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
alias watch-pods="watch -n 1 'kubectl get pods'"
alias sieve-local="SIEVE_API_URL=http://localhost:8000 SIEVE_API_KEY=eLX5jWjEOK63ftyo85QVAjfACjaP-1K-Ah43Vlo28CI sieve"
alias sieve-prod="SIEVE_API_URL=https://mango.sievedata.com SIEVE_API_KEY=1d1wDhbBGyQZXh2vjGJq7Chgr7aU00safFCClS-mZcE sieve"
alias cat="bat"

 [ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

export VI_MODE_SET_CURSOR=true
export KUBE_PS1_SYMBOL_ENABLE=false
export KUBE_PS1_PREFIX=""
export KUBE_PS1_SUFFIX=""

source <(kubectl completion zsh)  # set up autocomplete in zsh into the current shell

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/alexxi/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

export CONDA_CHANGEPS1=0


[[ $commands[kubectl] ]] && source <(kubectl completion zsh)


## Art
/bin/cat ~/.local/scripts/computer.txt
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/alexxi/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/alexxi/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/alexxi/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/alexxi/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/alexxi/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/alexxi/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/alexxi/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/alexxi/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

source ~/.bashrc
