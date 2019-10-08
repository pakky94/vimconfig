sudo pacman -Syu --noconfirm

sudo pacman -S --noconfirm pacaur python2 python2-pip python3 python-pip libxml2 libxslt zlib \
    ctags neovim python-neovim \
    powerline-fonts tmux zsh ttf-fira-code  \
    elinks msmtp neomutt offlineimap \
    clementine chromium mosh \
    keepassxc ksshaskpass pass \
    ibus 

sudo pacman -S noto-fonts-cjk noto-fonts-emoji noto-fonts

pacaur -S --noconfirm otf-stix mozc ibus-mozc \
    megasync pcloud-drive 

pacaur -S --noconfirm dropbox 

# install Oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

mkdir ~/.virtualenvs
python3 -m pip install --user -U virtualenv
~/.local/bin/virtualenv -p python3 ~/.virtualenvs/khard
~/.virtualenvs/khard/bin/pip install khard
mkdir ~/.virtualenvs/bin
ln -s ~/.virtualenvs/khard/bin/khard ~/.virtualenvs/bin 

~/.local/bin/virtualenv -p python3 ~/.virtualenvs/vdirsyncer
~/.virtualenvs/vdircyncer/pip install vdirsyncer
ln -s ~/.virtualenvs/vdirsyncer/bin/vdirsyncer ~/.virtualenvs/bin 

# copy the necessary files to the home directory
mkdir ~/Mail
mkdir ~/Mail/Gmail
mkdir ~/Mail/Netcourrier
mkdir ~/.msmtp.queue
mkdir ~/.contacts
cp -a ./redir/. ~/
chmod 700 ~/dotfiles/scripts/startmuttintmux.sh

sudo chsh -s /usr/bin/zsh pakky
