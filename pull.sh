# .zshrc
mkdir -p zsh
cp ~/.zshrc zsh/.zshrc

# Themes and custom plugins 
mkdir -p zsh/oh-my-zsh/custom
rsync -a ~/.oh-my-zsh/custom/ zsh/oh-my-zsh/custom/ --exclude=.git/

mkdir -p tmux 
cp ~/.tmux.conf tmux/.tmux.conf
