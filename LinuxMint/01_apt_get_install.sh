# Install base tools

# Set working directory as the directory of this script
cd "$(dirname "$0")"

# Updates & Install
sudo apt-get update

# Install Chromium
sudo apt-get install -y chromium-browser

# ZSH
sudo apt-get install -y zsh

# Powerfile Fonts (For ZSH)
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts && ./install.sh && cd .. && rm -rf fonts

# Oh-my-zsh
rm -fr ~/.oh-my-zsh/
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
chsh -s /bin/zsh

# Install VSCode
sudo snap install --classic code