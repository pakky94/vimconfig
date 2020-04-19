sudo pacman -Syu --noconfirm

sudo pacman -R manjaro-application-utility pamac-cli pamac-common pamac-gtk pamac-snap-plugin pamac-tray-appindicator

sudo pacman -S --noconfirm alacritty neovim tmux yay zsh \
	visual-studio-code-bin \
	i3blocks i3-gaps i3status feh picom \
	keepassxc syncthing \
	rofi \
	ibus

yay -S --noconfirm ttf-jetbrains-mono

# install Oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

sudo chsh -s /usr/bin/zsh pakky


git clone https://github.com/nvm-sh/nvm.git ~/.nvm
git clone https://github.com/pyenv/pyenv.git ~/.pyenv


# create redirects/links to config files to ~/dotfiles

ln ~/dotfiles/X/.Xmodmap ~/.Xmodmap
echo "source ~/dotfiles/zsh/zshrc" > ~/.zshrc
echo "source ~/dotfiles/tmux.conf" > ~/.tmux.conf
echo "\n\n#include ~/dotfiles/X/.Xresources" >> ~/.Xresources


mkdir ~/.config/nvim
cp ~/dotfiles/vim/init_lite.vim ~/.config/nvim/init.vim

mkdir ~/.config/rofi
ln ~/.dotfiles/rofi.config ~/.config/rofi/config

ln ~/.dotfiles/picom/picom.conf ~/.config/picom.conf

# i3 config

mkdir ~/.config/i3
ln ~/dotfiles/i3/config ~/.config/i3/config
mkdir ~/.config/i3blocks
ln ~/dotfiles/i3/i3blocks.conf ~/.config/i3blocks/config

sudo mv /usr/bin/ksplashqml /usr/bin/ksplashqml.old
sudo cp ~/dotfiles/i3/plasma-i3.desktop /usr/share/xsessions/plasma-i3.desktop


nvim +PlugInstall +UpdateRemotePlugins +qall


# sudo pacman -S --noconfirm pacaur python2 python2-pip python3 python-pip libxml2 libxslt zlib \
#     ctags neovim python-neovim \
#     powerline-fonts tmux zsh ttf-fira-code  \
#     elinks msmtp neomutt offlineimap \
#     clementine chromium mosh \
#     keepassxc ksshaskpass pass \
#     ibus 
# 
# sudo pacman -S noto-fonts-cjk noto-fonts-emoji noto-fonts
# 
# pacaur -S --noconfirm otf-stix mozc ibus-mozc \
#     megasync pcloud-drive 
# 
# pacaur -S --noconfirm dropbox 
# 
# # install Oh-my-zsh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# 
# mkdir ~/.virtualenvs
# python3 -m pip install --user -U virtualenv
# ~/.local/bin/virtualenv -p python3 ~/.virtualenvs/khard
# ~/.virtualenvs/khard/bin/pip install khard
# mkdir ~/.virtualenvs/bin
# ln -s ~/.virtualenvs/khard/bin/khard ~/.virtualenvs/bin 
# 
# ~/.local/bin/virtualenv -p python3 ~/.virtualenvs/vdirsyncer
# ~/.virtualenvs/vdircyncer/pip install vdirsyncer
# ln -s ~/.virtualenvs/vdirsyncer/bin/vdirsyncer ~/.virtualenvs/bin 
# 
##  copy the necessary files to the home directory
# mkdir ~/Mail
# mkdir ~/Mail/Gmail
# mkdir ~/Mail/Netcourrier
# mkdir ~/.msmtp.queue
# mkdir ~/.contacts
# cp -a ./redir/. ~/
# chmod 700 ~/dotfiles/scripts/startmuttintmux.sh
# sudo chsh -s /usr/bin/zsh pakky
