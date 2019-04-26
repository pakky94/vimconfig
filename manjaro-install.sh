sudo pacman -Syu --noconfirm

sudo pacman -S pacaur cmus elinks msmtp neomutt offlineimap python2 python2-pip python3 python3-pip tmux zsh libxml2 libxslt zlib

mkdir ~/.virtualenvs
python3 -m pip install --user -U virtualenv
virtualenv -p python3 ~/.virtualenvs/khard
~/.virtualenvs/khard/bin/pip install khard
mkdir ~/.virtualenvs/bin
ln -s ~/.virtualenvs/khard/bin/khard ~/.virtualenvs/bin 

virtualenv -p python3 ~/.virtualenvs/vdirsyncer
~/.virtualenvs/vdircyncer/pip install vdirsyncer
ln -s ~/.virtualenvs/vdircyncer/bin/vdirsyncer ~/.virtualenvs/bin 

# install Oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# copy the necessary files to the home directory
mkdir ~/Mail
mkdir ~/Mail/Gmail
mkdir ~/Mail/Netcourrier
mkdir ~/.msmtp.queue
mkdir ~/.contacts
cp -a ./redir/. ~/
chmod 700 ~/dotfiles/scripts/startmuttintmux.sh
