#!/bin/bash

# Source common functions
source "$(dirname "$0")/../common.sh"

# Main installation function
install_java() {
    if dpkg -s java &> /dev/null; then
        print_error "Java is already installed."
        return 1
    fi

    # Install Java
    if sudo apt install openjdk-11-jre -y > /dev/null 2>&1; then
        print_info "openjdk-11-jre installed successfully."
        
    else
        print_error "Could not install Java"
        return 1
    fi
}

# Execute the main function
install_java