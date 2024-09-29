#!/bin/bash

# Source common functions
source "$(dirname "$0")/../common.sh"

# Main uninstallation function
uninstall_java11() {
    if ! dpkg -s openjdk-11-jdk &> /dev/null; then
        print_error "Java 11 is not installed."
        return 1
    fi

    # Uninstall Java 11
    print_info "Uninstalling Java 11..."
    if sudo apt purge openjdk-11-jdk openjdk-11-jre -y; then
        print_info "Java 11 uninstalled successfully."
    else
        print_error "Could not uninstall Java 11."
        return 1
    fi

    # Remove Java 11 configuration
    print_info "Removing Java 11 configuration..."
    if sudo update-alternatives --remove java /usr/lib/jvm/java-11-openjdk-amd64/bin/java; then
        print_info "Java 11 configuration removed successfully."
    else
        print_error "Could not remove Java 11 configuration."
        return 1
    fi

}

# Execute the main function
uninstall_java11
