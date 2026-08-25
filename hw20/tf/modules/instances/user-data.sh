#!/bin/bash

echo "= = = = = = = = = ="
echo "Started user script"
echo "= = = = = = = = = ="

# Variables
REPO_URL='${repo_url}'

# Add Docker's official GPG key:
apt-get update -y
apt-get install -y ca-certificates curl
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "$${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/keyrings/docker.asc
EOF

# Install docker packages
apt-get update -y
apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
systemctl enable --now docker

# Get Dockerfile from git
mkdir -p /opt/nginx_configs
curl -fL "$${REPO_URL}" -o /opt/nginx_configs/Dockerfile

# Build new image, stop and remove previous container, start new container
docker build -f /opt/nginx_configs/Dockerfile -t hw20-nginx_configs:latest /opt/nginx_configs
docker rm -f custom-nginx_configs 2>/dev/null || true
docker run --name custom-nginx_configs --restart unless-stopped -p 80:80 -d hw20-nginx_configs:latest

echo "= = = = = = = = = ="
echo "Finished user script"
echo "= = = = = = = = = ="