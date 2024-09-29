#!/bin/bash

# Source common functions
source "$(dirname "$0")/../common.sh"

# Main installation function
install_sqlitebrowser() {
    if dpkg -s sqlitebrowser &> /dev/null; then
        print_error "SQLite Browser is already installed."
        return 1
    fi

    # Install SQLite Browser
    if sudo apt install sqlitebrowser -y > /dev/null 2>&1; then
        print_info "SQLite Browser installed successfully."
        
    else
        print_error "Could not install SQLite Browser."
        return 1
    fi
}

# Execute the main function
install_sqlitebrowser