#!/bin/bash

# Source common functions
source "$(dirname "$0")/../common.sh"

# Main installation function
install_pidcat() {
    if command -v pidcat &> /dev/null; then
        print_error "pidcat is already installed."
        return 1
    fi

    # Download pidcat
    if wget -q https://raw.githubusercontent.com/JakeWharton/pidcat/master/pidcat.py -O /tmp/pidcat; then
        print_info "pidcat downloaded successfully."
    else
        print_error "Could not download pidcat."
        return 1
    fi

	sed -i '1s/.*/#!\/usr\/bin\/python3/' /tmp/pidcat
	sudo mv /tmp/pidcat /usr/local/bin/pidcat

    # Set execution permissions
    print_info "Setting execution permissions..."
    if sudo chmod +x /usr/local/bin/pidcat; then
        print_info "Execution permissions set successfully."
    else
        print_error "Could not set execution permissions."
        return 1
    fi

    print_info "pidcat has been installed successfully at /usr/local/bin/pidcat."
    print_warning "Remember that Pidcat needs adb to work"
}

# Execute the main function
install_pidcat
