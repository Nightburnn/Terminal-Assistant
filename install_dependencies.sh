#!/bin/bash

echo "Setting up Terminal Assistant..."

# Update system packages
sudo apt update -y && sudo apt upgrade -y

# Install necessary tools
echo "Installing required tools..."
sudo apt install -y git curl

# Clone the repository (if not already cloned)
if [ ! -d "~/terminal-assistant" ]; then
    git clone https://github.com/Nightburnn/Terminal-Assistant ~/terminal-assistant
fi

# Backup existing .bashrc
if [ -f ~/.bashrc ]; then
    echo "Backing up your current .bashrc to ~/.bashrc.bak"
    cp ~/.bashrc ~/.bashrc.bak
fi

# Add Terminal Assistant to .bashrc
if ! grep -q "terminal_assistant" ~/.bashrc; then
    echo "Adding Terminal Assistant to .bashrc..."
    echo 'source ~/terminal-assistant/.bashrc' >> ~/.bashrc
fi

# Source .bashrc
echo "Reloading .bashrc..."
source ~/.bashrc

echo "Setup complete! Type 'terminal_assistant' to start using the program."
