export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="alexxi"

plugins=(
	git
    zsh-autosuggestions
    # vi-mode
    kube-ps1
    # zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ALEX
export PATH
export PATH="/Users/alexxi/go/bin:$PATH"
export PATH="/Users/alexxi/.local/scripts:$PATH"
export PATH="/Applications/CMake.app/Contents/bin:$PATH"
export PATH="/Users/alexxi/Library/Python/3.9/bin:$PATH"
export GOARCH="arm64"
export GOOS="darwin"
export GOPATH="/Users/alexxi/go"
export GOROOT=/usr/local/opt/go/libexec
unset GOBIN
#export GOBIN="$GOPATH/bin"
export LUA_PATH=""
export LUA_PATH="$LUA_PATH;/Users/alexxi/.config/nvim/?/init.lua"
export LUA_PATH="$LUA_PATH;/Users/alexxi/.config/nvim/?.lua"
export LUA_PATH="$LUA_PATH;/Users/alexxi/Desktop/CS/recall.nvim"
export LSCOLORS="exgxcxdxbxegedabagacad"

bindkey -s ^f "tmux-sessionizer-full\n"
KEYTIMEOUT=5

alias k="kubectl"
alias h='history'
alias l="ls -CF"
alias t='tmux attach || tmux new-session'
alias ta="tmux attach -t"
alias td="tmux kill-session -t"
alias tn="tmux new -t"
alias tl='tmux list-sessions'
alias ts='tmux-switch-sessions'
alias ll='ls -l -a'
alias zshconfig="nvim ~/.zshrc"
alias nvim='/Users/alexxi/bin/nvim-macos-arm64/bin/nvim'

function gs {
    if [ $# -eq 0 ]; then
        git status
    else
        git switch "$1"
    fi
}


[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

export VI_MODE_SET_CURSOR=true

# source <(kubectl completion zsh)  # set up autocomplete in zsh into the current shell
# echo '[[ $commands[kubectl] ]] && source <(kubectl completion zsh)' >> ~/.zshrc # add autocomplete permanently to your zsh shell

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/alexxi/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

[[ $commands[kubectl] ]] && source <(kubectl completion zsh)


## Art
cat ~/.local/scripts/computer.txt

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/alexxi/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/alexxi/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/alexxi/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/alexxi/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# bun completions
[ -s "/Users/alexxi/.bun/_bun" ] && source "/Users/alexxi/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

[[ -s "/Users/alexxi/.gvm/scripts/gvm" ]] && source "/Users/alexxi/.gvm/scripts/gvm"

export KUBECONFIG=~/.kube/config

source ~/.bash_profile

# pnpm
export PNPM_HOME="/Users/alexxi/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

kforward() {
    local namespace=$1
    local type=${2:-worker}

    if [ -z "$namespace" ]; then
        echo "Error: Namespace is required."
        echo "Usage: forward_latest_pod <namespace> [worker|node]"
        return 1
    fi

    local label
    local local_port
    local container_port

    case $type in
        worker)
            label="app=flow-video-worker"
            local_port=8082
            container_port=8080
            ;;
        node)
            label="app=flow-node-backend"
            local_port=9999
            container_port=8080
            ;;
        recommendation)
            label="app=flow-recommendation-backend"
            local_port=8000
            container_port=8000
            ;;
        *)
            echo "Error: Invalid type. Use 'worker' or 'node'."
            return 1
            ;;
    esac

    local pod_name=$(kubectl get pods -n "$namespace" -l $label --sort-by=.metadata.creationTimestamp -o jsonpath='{.items[-1].metadata.name}')

    if [ -z "$pod_name" ]; then
        echo "Error: No $type pods found in namespace $namespace"
        return 1
    fi

    echo "Forwarding the latest $type pod: $pod_name"
    kubectl port-forward "$pod_name" $local_port:$container_port -n "$namespace"
}

# -----------------------------------------------------------------------------
# AI-powered Git Commit Function
# Copy paste this gist into your ~/.bashrc or ~/.zshrc to gain the `gcm` command. It:
# 1) gets the current staged changed diff
# 2) sends them to an LLM to write the git commit message
# 3) allows you to easily accept, edit, regenerate, cancel
# But - just read and edit the code however you like
# the `llm` CLI util is awesome, can get it here: https://llm.datasette.io/en/stable/

gcommit() {
    # Function to generate commit message
    generate_commit_message() {
        git diff --cached | llm "
Below is a diff of all staged changes, coming from the command: git diff --cached
Please include a semantic commit prefix (feat, chore, docs, style, refactor, perf, test, fix, release) and generate a concise, one-line commit message for these changes.
"
    }

    # Function to read user input compatibly with both Bash and Zsh
    read_input() {
        if [ -n "$ZSH_VERSION" ]; then
            echo -n "$1"
            read -r REPLY
        else
            read -p "$1" -r REPLY
        fi
    }

    # Main script
    echo "Generating AI-powered commit message..."
    commit_message=$(generate_commit_message)

    while true; do
        echo -e "\nProposed commit message:"
        echo "$commit_message"

        read_input "Do you want to (a)ccept, (e)dit, (r)egenerate, or (c)ancel? "
        choice=$REPLY

        case "$choice" in
            a|A )
                if git commit -m "$commit_message"; then
                    echo "Changes committed successfully!"
                    return 0
                else
                    echo "Commit failed. Please check your changes and try again."
                    return 1
                fi
                ;;
            e|E )
                read_input "Enter your commit message: "
                commit_message=$REPLY
                if [ -n "$commit_message" ] && git commit -m "$commit_message"; then
                    echo "Changes committed successfully with your message!"
                    return 0
                else
                    echo "Commit failed. Please check your message and try again."
                    return 1
                fi
                ;;
            r|R )
                echo "Regenerating commit message..."
                commit_message=$(generate_commit_message)
                ;;
            c|C )
                echo "Commit cancelled."
                return 1
                ;;
            * )
                echo "Invalid choice. Please try again."
                ;;
        esac
    done
}

source ~/secrets.sh
