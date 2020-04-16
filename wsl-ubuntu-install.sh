sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install zsh -y

sudo apt-get install --no-install-recommends make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev -y

cd ~/
git clone https://github.com/nvm-sh/nvm.git .nvm
cd ~/.nvm
git checkout v0.35.3
.nvm.sh

cd ~/
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

sudo chsh $USER -s zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

curl -LO https://github.com/BurntSushi/ripgrep/releases/download/12.0.1/ripgrep_12.0.1_amd64.deb
sudo dpkg -i ripgrep_12.0.1_amd64.deb
rm ripgrep_12.0.1_amd64.deb

cp ./redir/.zshrc_wsl ~/.zshrc
cp ./redir/.tmux.conf ~/.tmux.conf

sudo chown -R 1000:1000 /home/$USER/.nvm
sudo chown -R $USER:$(id -gn $USER) /home/$USER/.config
