#!/bin/bash
# 24.02.2023
# Created by Joachim Jamtvedt Børresen, s117423 USN

# Script to set up a ROS2 package
# Require that you already have installed ROS2, and have workspace (ros2_ws) on root.

cd ~/ros2_ws/src
read -p "Name on your ROS2 package: (xxxxxx_controller/etc): " package_name
ros2 pkg create $package_name --build-type ament_python --dependencies rclpy

# Update and upgrade
sudo apt update && sudo apt upgrade -y

# Installing vscode
sudo snap install code --classic

# Installing package installer for Python 3
sudo apt install python3-pip -y

# Installing setuptools package
pip3 install setuptools==58.2.0

# Builds workspace
cd ~/ros2_ws
colcon build
