# Check the current release and update if necessary
sudo curl -L https://github.com/docker/compose/releases/download/1.27.4/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

# Set the permission
sudo chmod +x /usr/local/bin/docker-compose

# Verify the version installed
docker-compose --version
