sudo apt-get install zsh vim xmonad suckless-tools synapse

mkdir ~/.xmonad
ln ./xmonad.hs ~/.xmonad/
xmonad --recompile
xmonad --restart

wget -O dropbox-dist "https://www.dropbox.com/download?plat=lnx.x86"
tar -xvf dropbox-dist
rm dropbox-dist
mv .dropbox-dist ~
~/.dropbox-dist/dropboxd&
sudo cp dropboxd.service /etc/systemd/system
sudo systemctl daemon-reload
sudo systemctl enable dropboxd.service
sudo systemctl start dropboxd.service

git config --global user.name "Cass May"
git config --global user.email "ingeniousmammal@gmail.com"

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
rm ~/.vimrc
ln .vimrc ~/.vimrc
vim +BundleInstall +qall

git submodule init
git submodule update

fonts/install.sh

# assumes gnome terminal
gsettings set org.gnome.desktop.interface monospace-font-name 'Inconsolata for Powerline Medium 14'

sudo add-apt-repository ppa:gekkio/xmonad
sudo apt-get update
sudo apt-get install gnome-session-xmonad

cp custom-magic.zsh-theme oh-my-zsh/themes/
sed -i "s%mv -f ~/.zshrc-omztemp ~/.zshrc%rm ~/.zshrc\n  ln -s $PWD/.zshrc ~/.zshrc%" oh-my-zsh/tools/install.sh
oh-my-zsh/tools/install.sh
