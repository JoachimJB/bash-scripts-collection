#!/bin/bash
# 24.02.2023
# Created by Joachim Jamtvedt Børresen, s117423 USN

# Script to set up workspace with colcon

# Update and upgrade
sudo apt update && sudo apt upgrade -y

# Setting up colcon build
sudo apt install python3-colcon-common-extensions -y

# Set up autocomplete
# Sourcing to ~/.bashrc
check_sourced(){
	grep -E $1 ~/.bashrc > /dev/null
	
	if [ $? -eq 0 ]; then
		echo "$1 already sourced"
	else	
		echo "source $1" >> ~/.bashrc
	fi
}

# Sourcing colcon-argcomplete.bash to ~/.bashrc
check_sourced "/usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash"

# Creating source folder (src)
mkdir ~/ros2_ws/src

# Build colcon workspace
colcon build

# Sourcing setup.bash to ~/.bashrc
check_sourced "~/ros2_ws/install/setup.bash"
