
#!/bin/bash

# Source common functions
source "$(dirname "$0")/../common.sh"

# Main installation function
install_reflutter() {
    if command -v reflutter &> /dev/null; then
        print_error "reflutter is already installed."
        return 1
    fi

    if pip3 install reflutter -qq; then
        print_info "reflutter been installed correctly."
    else
        print_info "Installation failed"
    fi
}

# Execute the main function
install_reflutter