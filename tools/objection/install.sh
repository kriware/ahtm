#!/bin/bash

# Source common functions
source "$(dirname "$0")/../common.sh"

# Main installation function
install_objection() {
    if command -v objection &> /dev/null; then
        print_error "objection is already installed."
        return 1
    fi

    if pip3 install objection -qq; then
        print_warning "objection also installs litecli and frida"
        print_info "objection has been installed correctly."
    else
        print_info "Installation failed"
    fi
}

# Execute the main function
install_objection
