#!/bin/bash

# Source common functions
source "$(dirname "$0")/../common.sh"

# Main uninstallation function
uninstall_sqlitebrowser() {
    if ! dpkg -s sqlitebrowser &> /dev/null; then
        print_error "SQLite Browser is not installed."
        return 1
    fi

    # Uninstall SQLite Browser
    if sudo apt purge sqlitebrowser -y > /dev/null 2>&1; then
        print_info "SQLite Browser uninstalled successfully."
    else
        print_error "Could not uninstall SQLite Browser."
        return 1
    fi
}


# Execute the main function
uninstall_sqlitebrowser
