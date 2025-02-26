#!/bin/bash

# Update system
sudo apt update && sudo apt upgrade -y

# Install dependencies
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Install Java 17
echo "Installing Java 17..."
sudo apt install -y openjdk-17-jdk

# Verify Java Installation
echo "Java 17 Installation Verification..."
java -version

# Set JAVA_HOME environment variable
echo "Setting JAVA_HOME environment variable..."
echo "export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64" >> ~/.bashrc
echo "export PATH=\$PATH:\$JAVA_HOME/bin" >> ~/.bashrc
source ~/.bashrc

# Install Maven
echo "Installing Maven..."
sudo apt install -y maven

# Verify Maven Installation
echo "Maven Installation Verification..."
mvn -version

# Install Docker
echo "Installing Docker..."
# Add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Set up Docker stable repository
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update apt package index
sudo apt update

# Install Docker Engine
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Start and enable Docker service
sudo systemctl start docker
sudo systemctl enable docker

# Verify Docker Installation
echo "Docker Installation Verification..."
docker --version

# Add current user to Docker group (optional, to run docker without sudo)
sudo usermod -aG docker $USER
echo "User added to docker group. You may need to log out and log back in to use docker without sudo."

# Final message
echo "Installation of Java 17, Maven, and Docker is complete!"
