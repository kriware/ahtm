#!/bin/bash

# Source common functions
source "$(dirname "$0")/../common.sh"

# Main uninstallation function
uninstall_objection() {
    if ! pip3 show objection &> /dev/null; then
        print_error "objection is not installed."
        return 1
    fi

    if pip3 uninstall objection -y -q > /dev/null 2>&1; then
        print_info "objection uninstalled successfully."
    else
        print_error "Could not uninstall objection."
        return 1
    fi

}

# Execute the main function
uninstall_objection