#!/bin/bash

# Add Jenkins repository key
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

# Add Jenkins repository
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update package list to include Jenkins
echo "Updating package list..."
sudo apt update

# Install Jenkins
echo "Installing Jenkins..."
sudo apt install -y jenkins

# Start Jenkins service
echo "Starting Jenkins service..."
sudo systemctl start jenkins

# Enable Jenkins to start on boot
echo "Enabling Jenkins to start on boot..."
sudo systemctl enable jenkins

# Check Jenkins status
echo "Checking Jenkins service status..."
sudo systemctl status jenkins

# Final message
echo "Jenkins installation is complete!"
echo "Access Jenkins web interface by going to http://localhost:8080 and using the initial admin password shown above."
