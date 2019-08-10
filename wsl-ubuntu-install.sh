sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update && sudo apt-get upgrade
sudo apt-get install neovim
sudo apt-get install python-dev python-pip python3-dev python3-pip
pip install --user pynvim
pip3 install --user black pynvim

curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo npm install -g neovim

curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb
sudo dpkg -i ripgrep_11.0.2_amd64.deb