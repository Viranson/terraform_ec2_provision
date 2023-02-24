#!/bin/bash
#INSTALL NGINX
sudo apt update
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx

# this script is only tested on ubuntu focal 20.04 (LTS)
user=ubuntu
# install docker
sudo apt-get update
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update                                                                                                                                                                                                                                                            
sudo apt-get install -y docker-ce docker-ce-cli docker-compose containerd.io                                                                                                                                                                                                                  
sudo systemctl enable docker                                                                                                                                                                                                                                                   
sudo systemctl start docker                                                                                                                                                                                                                                                    
sudo usermod -aG docker $user
newgrp docker