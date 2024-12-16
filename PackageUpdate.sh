#!/bin/bash

# Function to prompt the user
ask_user() {
    read -p "$1 [y/N]: " choice
    case "$choice" in
        [Yy]*) return 0 ;;  # Yes
        *) return 1 ;;      # No (default)
    esac
}

# Update package lists
if ask_user "Do you want to update package lists?"; then
    echo "Updating package lists..."
    sudo apt update
else
    echo "Skipping update of package lists."
fi

# Upgrade installed packages
if ask_user "Do you want to upgrade installed packages?"; then
    echo "Upgrading installed packages..."
    sudo apt upgrade -y
else
    echo "Skipping upgrade of installed packages."
fi

# Full upgrade (optional)
if ask_user "Do you want to perform a full upgrade (handles kernel updates)?"; then
    echo "Performing full upgrade..."
    sudo apt full-upgrade -y
else
    echo "Skipping full upgrade."
fi

# Autoremove unnecessary packages
if ask_user "Do you want to remove unnecessary packages?"; then
    echo "Removing unnecessary packages..."
    sudo apt autoremove -y
else
    echo "Skipping removal of unnecessary packages."
fi

# Clean up cached packages
if ask_user "Do you want to clean up cached package files?"; then
    echo "Cleaning up cached packages..."
    sudo apt clean
else
    echo "Skipping cleanup of cached packages."
fi

# Optional: Install specific packages
if ask_user "Do you want to install specific packages (edit script to specify)?"; then
    echo "Installing specific packages..."
    # Replace 'package_name' with the package(s) you want to install
    sudo apt install -y package_name
else
    echo "Skipping installation of specific packages."
fi

echo "All tasks completed (or skipped) based on your choices!"
