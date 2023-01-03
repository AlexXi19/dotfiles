# Pulls and updates all the dot files into this repo 

# .zshrc
mkdir -p zsh
cp ~/.zshrc zsh/.zshrc

# Themes and custom plugins 
mkdir -p zsh/oh-my-zsh/custom
rsync -a ~/.oh-my-zsh/custom/ zsh/oh-my-zsh/custom/ --exclude=.git/

# Tmux
mkdir -p tmux 
cp ~/.tmux.conf tmux/.tmux.conf

# Bash scripts 
mkdir -p .local/scripts
rsync -a ~/.local/scripts/ .local/scripts/

# Karabiner 
mkdir -p karabiner
rsync -a ~/.config/karabiner/ karabiner/ --exclude=automatic_backups/

# iTerm2 
mkdir -p iTerm2
rsync -a ~/.config/iTerm2-preference/ iTerm2/

# Neovim 
mkdir -p nvim 
rsync -a ~/.config/nvim/ nvim/
