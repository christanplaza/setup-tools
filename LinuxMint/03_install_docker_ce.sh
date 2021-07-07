# Install docker ce with official ppa

# Set working directory as the directory of this script
cd "$(dirname "$0")"

# Get Ubuntu code name
. /etc/os-release
ubuntu_code=$UBUNTU_CODENAME
echo "Ubuntu code: $ubuntu_code"

# Docker - Uninstall old docker versions
sudo apt-get remove docker docker-engine docker.io

# Docker - Install packages to allow apt to use a repository over HTTPS
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# Add Docker’s official GPG key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Use the following command to set up the stable repository.
# Get the ubuntu package base for Linux Mint on https://linuxmint.com/download_all.php
### change xenial to current package base code (all lower case)
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $ubuntu_code stable"

# Update package index & Install Docker (CE version)
sudo apt-get update
sudo apt-get install -y docker-ce

# Add current user to docker group
sudo usermod -aG docker $USER