#!/bin/bash

# Source common functions
source "$(dirname "$0")/../common.sh"

# Main installation function
install_litecli() {
    if command -v litecli &> /dev/null; then
        print_error "litecli is already installed."
        return 1
    fi

    if pip3 install -U litecli -qq; then
        print_info "litecli has been installed correctly."
    else
        print_info "Installation failed"
    fi
}

# Execute the main function
install_litecli
