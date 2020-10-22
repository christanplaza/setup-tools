# Install GPG Keys to verify installation package
gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

# Installing Pre-requisites
sudo apt-get install software-properties-common

# Add PPA and install the package
sudo apt-add-repository -y ppa:rael-gc/rvm
sudo apt-get update
sudo apt-get install rvm

echo 'source "/etc/profile.d/rvm.sh"' >> ~/.bashrc

echo 'RVM Installation Done, please reboot your PC to apply the new changes'
