# Pulls and updates all the dot files into this repo 

# Bash scripts 
mkdir -p .local/scripts
rsync -a ~/.local/scripts/ .local/scripts/

# Themes and custom plugins 
mkdir -p .oh-my-zsh
rsync -a ~/.oh-my-zsh/custom/ .oh-my-zsh/custom/ --exclude=.git/

# .zshrc
# cp ~/.profile .profile
cp ~/.zshrc .zshrc

# Tmux
cp ~/.tmux.conf .tmux.conf

# Configurations
mkdir -p .config
cd .config

# Karabiner 
# mkdir -p karabiner
# rsync -a ~/.config/karabiner/ karabiner/ --exclude=automatic_backups/

# iTerm2 
# mkdir -p iTerm2
# rsync -a ~/.config/iTerm2-preference/ iTerm2/

# Neovim 
rm -rf nvim
mkdir -p nvim 
rsync -a ~/.config/nvim/ nvim/ --exclude=pack/

# Ghostty
rm -rf ghostty
mkdir -p ghostty
rsync -a ~/.config/ghostty/ ghostty/

# Neofetch
rm -rf neofetch
mkdir -p neofetch
rsync -a ~/.config/neofetch/ neofetch/

# yazi
rm -rf yazi
mkdir -p yazi
rsync -a ~/.config/yazi/ yazi/

# Gitignore 
# p ~/.gitignore .gitignore
