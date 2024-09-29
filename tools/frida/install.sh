#!/bin/bash

# Source common functions
source "$(dirname "$0")/../common.sh"

# Main installation function
install_frida() {
    if command -v frida &> /dev/null; then
        print_error "Frida is already installed."
        return 1
    fi

    if pip3 install frida-tools -qq; then
        print_info "Frida has been installed correctly."
        
        # Get installed Frida version
        FRIDA_VERSION=$(frida --version)
        print_info "Installed Frida. Version: $FRIDA_VERSION"

        if ! wget -q "https://github.com/frida/frida/releases/download/$FRIDA_VERSION/frida-server-$FRIDA_VERSION-android-arm64.xz" ; then
            echo "[ERROR] Failed to download Frida Server"
            exit 1
        else
            xz -d frida-server-$FRIDA_VERSION-android-arm64.xz
            print_info "Frida Server downloaded and decompressed"   
        fi

    else
        print_info "Installation failed"
    fi
}

# Execute the main function
install_frida
