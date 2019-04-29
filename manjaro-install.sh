sudo pacman -Syu --noconfirm

sudo pacman -S --noconfirm pacaur python2 python2-pip python3 python3-pip libxml2 libxslt zlib \
    powerline-fonts tmux zsh ttf-fira-code  \
    elinks msmtp neomutt offlineimap \
    clementine chromium \
    keepassxc ksshaskpass pass \

sudo pacaur -S --noconfirm mozk ibus-mozk otf-stix \
    dropbox megasync pcloud-drive \

# install Oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

mkdir ~/.virtualenvs
python3 -m pip install --user -U virtualenv
virtualenv -p python3 ~/.virtualenvs/khard
~/.virtualenvs/khard/bin/pip install khard
mkdir ~/.virtualenvs/bin
ln -s ~/.virtualenvs/khard/bin/khard ~/.virtualenvs/bin 

virtualenv -p python3 ~/.virtualenvs/vdirsyncer
~/.virtualenvs/vdircyncer/pip install vdirsyncer
ln -s ~/.virtualenvs/vdircyncer/bin/vdirsyncer ~/.virtualenvs/bin 

# copy the necessary files to the home directory
mkdir ~/Mail
mkdir ~/Mail/Gmail
mkdir ~/Mail/Netcourrier
mkdir ~/.msmtp.queue
mkdir ~/.contacts
cp -a ./redir/. ~/
chmod 700 ~/dotfiles/scripts/startmuttintmux.sh

sudo chsh -s /usr/bin/zsh pakky
