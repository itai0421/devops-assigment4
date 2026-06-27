#!/bin/bash

# עדכון מערכת
sudo apt update -y

# התקנת Java
sudo apt install -y openjdk-11-jdk

# התקנת Jenkins
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update -y
sudo apt install -y jenkins

# התקנת Docker
sudo apt install -y docker.io
sudo usermod -aG docker jenkins

# הפעלה
sudo systemctl enable jenkins
sudo systemctl start jenkins
