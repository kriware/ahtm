#!/bin/bash

# TODO
# Source common functions
source "$(dirname "$0")/../common.sh"

$VERSION_INSTALLED=""

get_version_installed() {
    if ! command -v jadx &> /dev/null; then
        print_error "JADX is not installed or not in PATH."
        return 1
    fi

    VERSION_INSTALLED=$(jadx --version 2>&1)
    if [ $? -ne 0 ]; then
        print_error "Failed to get JADX version."
        return 1
    fi

    return 0
}

# TODO: