# Applies the dot files in this repo, only applies shell scripts and neovim config

# Bash scripts 
mkdir -p ~/.local/scripts
rsync -a .local/scripts/ ~/.local/scripts/

# Themes and custom plugins
mkdir -p .oh-my-zsh
rsync -a .oh-my-zsh/custom/ ~/.oh-my-zsh/custom/ 

# .zshrc
# cp .zshrc ~/.zshrc
# cp .profile ~/.profile

# Tmux
cp .tmux.conf ~/.tmux.conf

# Neovim
mkdir -p ~/.config/nvim
cp -r ./.config/nvim/ ~/.config/nvim/ 

# Ghostty
mkdir -p ~/.config/ghostty
cp -r ./.config/ghostty/ ~/.config/ghostty/
