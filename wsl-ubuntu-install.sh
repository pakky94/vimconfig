cp -a ./redir/. ~/
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install neovim python-dev python-pip python3-dev python3-pip -y
pip install --user pynvim
pip3 install --user pynvim

curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y nodejs -y
sudo npm install -g neovim

curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb
sudo dpkg -i ripgrep_11.0.2_amd64.deb

sudo nvim +PlugInstall +UpdateRemotePlugins +qall
sudo nvim +qall

sudo chown -R 1000:1000 /home/$USER/.npm
sudo chown -R $USER:$(id -gn $USER) /home/$USER/.config
