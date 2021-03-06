#!/bin/bash
# Avoids getting multiple password requests for sudo
trap "exit" INT TERM; trap "kill 0" EXIT; sudo -v || exit $?; sleep 1; while true; do sleep 60; sudo -nv; done 2>/dev/null &

sudo pacman -Syu --noconfirm

sudo pacman -R --noconfirm manjaro-application-utility pamac-cli pamac-common pamac-gtk pamac-snap-plugin pamac-tray-appindicator yakuake

sudo pacman -S --noconfirm alacritty bat exa fd fish neovim ripgrep tmux yay zsh \
    feh i3blocks i3-gaps i3status picom \
    flatpak keepassxc syncthing \
    rofi \
    ibus \
    meson extra-cmake-modules

yay -S --noconfirm ttf-jetbrains-mono ttf-font-awesome-4 \
    joplin-appimg syncthingtray visual-studio-code-bin \
    ibus-mozc ibus-qt \
    gamemode lib32-gamemode

#yay -S --noconfirm xf86-input-wacom wacom-utility

wget -O ~/Documents/archlinux_wiki.zim http://download.kiwix.org/zim/archlinux_en_all_maxi.zim

# install Oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#sudo chsh -s /usr/bin/zsh pakky

git clone https://github.com/nvm-sh/nvm.git ~/.nvm
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

# create redirects/links to config files to ~/dotfiles

ln -s ~/dotfiles/X/.XCompose ~/.XCompose
ln -s ~/dotfiles/X/.Xmodmap ~/.Xmodmap

ln -s ~/dotfiles/alacritty.yml ~/.alacritty.yml

echo "source ~/dotfiles/zsh/zshrc" > ~/.zshrc
echo "source ~/dotfiles/tmux.conf" > ~/.tmux.conf
echo "\n\n#include ~/dotfiles/X/.Xresources" >> ~/.Xresources


mkdir ~/.config/nvim
#cp ~/dotfiles/vim/init_lite.vim ~/.config/nvim/init.vim
cp ~/dotfiles/vim/init.vim ~/.config/nvim/init.vim

#mkdir ~/.config/termite
#ln ~/dotfiles/termite/config ~/.config/termite/config

mkdir ~/.config/rofi
ln -s ~/dotfiles/rofi.config ~/.config/rofi/config

ln -s ~/dotfiles/picom/picom.conf ~/.config/picom.conf

# i3 config

mkdir ~/.config/i3
ln -s ~/dotfiles/i3/config ~/.config/i3/config
#mkdir ~/.config/i3blocks
#ln ~/dotfiles/i3/i3blocks.conf ~/.config/i3blocks/config

sudo mv /usr/bin/ksplashqml /usr/bin/ksplashqml.old
sudo cp ~/dotfiles/i3/plasma-i3.desktop /usr/share/xsessions/plasma-i3.desktop


# Install python 3.8.2
~/.pyenv/bin/pyenv install 3.8.2

# Install latest lts version of nodejs
source ~/.nvm/nvm.sh
nvm install --lts

nvim +PlugInstall +UpdateRemotePlugins +qall

flatpak install -y flathub \
    org.kiwix.desktop \
    org.jdownloader.JDownloader \


# Install plasma-i3-workspaces
git clone https://github.com/pakky94/plasma-i3-workspaces ~/plasma-i3-workspaces
cd ~/plasma-i3-workspaces
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=`kf5-config --prefix` -DCMAKE_BUILD_TYPE=Release -DLIB_INSTALL_DIR=lib -DKDE_INSTALL_USE_QT_SYS_PATHS=ON ../
make
sudo make install
cd ~
#rm -r ./plasma-i3-workspaces


# install Oh-my-fish
ln -s ~/dotfiles/fish/fish ~/.config
ln -s ~/dotfiles/fish/omf ~/.config
curl -L https://get.oh-my.fish | fish
sudo chsh -s /usr/bin/fish pakky


# Mutt setup
# yay -S elinks msmtp neomutt offlineimap
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
# mkdir ~/Mail
# mkdir ~/Mail/Gmail
# mkdir ~/Mail/Netcourrier
# mkdir ~/.msmtp.queue
# mkdir ~/.contacts
# cp -a ./redir/. ~/
# chmod 700 ~/dotfiles/scripts/startmuttintmux.sh
