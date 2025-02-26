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
java --version

# Install Maven
echo "Installing Maven..."
sudo apt install -y maven

# Verify Maven Installation
echo "Maven Installation Verification..."
mvn -v

# Install Docker
echo "Installing Docker..."
#install required packages
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
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

# Final message
echo "Installation of Java 17, Maven, and Docker is completed!"
