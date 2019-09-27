sudo add-apt-repository -y ppa:bit-team/stable
sudo add-apt-repository -y ppa:phoerious/keepassxc


sudo apt-get update & sudo apt-get upgrade -y
sudo apt-get install -y backintime-qt4 keepassxc \
    build-essential libssl-dev zlib1g-dev libbz2-dev \
    libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
    xz-utils tk-dev libffi-dev liblzma-dev python-openssl git \
    tmux zsh \
    chromium-browser \

curl -LJo ~/pandoc.deb https://github.com/jgm/pandoc/releases/download/2.7.3/pandoc-2.7.3-1-amd64.deb
sudo dpkg -i ~/pandoc.deb

git clone https://github.com/powerline/fonts.git --depth=1 ~/fonts
cd ~/fonts
./install.sh
cd ..
rm -rf fonts

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

git clone https://github.com/pyenv/pyenv.git ~/.pyenv

git clone https://github.com/nvm-sh/nvm.git ~/.nvm
cd ~/.nvm
git checkout v0.34.0

cd ~

mkdir ~/.config/nvim
cp ~/dotfiles/redir/.config/nvim/init.vim ~/.config/nvim/init.vim
cp ~/dotfiles/tmux.conf ~/.tmux.conf
cp ~/dotfiles/zsh/zshrc ~/.zshrc
