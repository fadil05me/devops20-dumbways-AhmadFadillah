#!/bin/bash

# Cek Update
echo -e "\n\n~~~Step 1: Cek Update!~~~\n\n"
sudo apt-get update

# Upgrade
echo -e "\n\n~~~Step 2: Melakukan Upgrade!~~~\n\n"
sudo apt-get upgrade -y

# Selesai Update & Upgrade
echo -e "\n\n~~~Selesai Update & Upgrade!~~~\n\n"

# Add Docker's official GPG key:
echo -e "\n\n~~~Step 3: Menambahkan GPG key!~~~\n\n"
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo -e "\n\n~~~Selesai menambahkan GPG key!~~~\n\n"

# Add the repository to Apt sources:

echo -e "\n\n~~~Step 4: Menambahkan Docker ke repository APT!~~~\n"

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sleep 1
echo -n "."
sleep 1
echo -n "."
sleep 1
echo -n "."

echo -e "\n\n~~~Selesai menambahkan Docker ke repository APT!~~~\n\n"

echo -e "\n\n~~~Step 5: Cek Update!~~~\n\n"
sudo apt-get update

echo -e "\n\n~~~Step 6: Install Docker!~~~\n\n"
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# Add current user to docker group
echo -e "\n\n~~~Adding current user to Docker Group!~~~\n\n"
sudo usermod -aG docker $USER

# Cek versi Docker
echo -e "\n\n~~~Cek versi Docker!~~~\n\n"
docker -v

echo -e "\n\n~~Selesai!~~~\n\n"
