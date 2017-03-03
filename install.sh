sudo apt-get install vim xmonad synapse

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -s .vimrc ~/.vimrc
vim +BundleInstall +qall

git submodule init

fonts/.install.sh

# assumes gnome terminal
gsettings set org.gnome.desktop.interface monospace-font-name 'Inconsolata for Powerline Medium 14'

sudo add-apt-repository ppa:gekkio/xmonad
sudo apt-get update
sudo apt-get install gnome-session-xmonad

cp custom-magic.zsh-theme oh-my-zsh/themes/
sed -i "s%mv -f ~/.zshrc-omztemp ~/.zshrc%rm ~/.zshrc\n  ln -s $PWD/.zshrc ~/.zshrc%" oh-my-zsh/tools/install.sh
oh-my-zsh/tools/install.sh
