#!/bin/bash

# Source common functions
source "$(dirname "$0")/../common.sh"

# Main uninstallation function
uninstall_reflutter() {
    if ! pip3 show reflutter &> /dev/null; then
        print_error "reflutter is not installed."
        return 1
    fi

    if pip3 uninstall reflutter -y -q > /dev/null 2>&1; then
        print_info "reflutter uninstalled successfully."
    else
        print_error "Could not uninstall reflutter."
        return 1
    fi

}

# Execute the main function
uninstall_reflutter