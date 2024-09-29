#!/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# Function to print error messages
print_error() {
    echo -e "${RED}[ERROR  ] $1${NC}"
}

# Function to print information messages
print_info() {
        echo -e "${NC}[INFO   ] $1${NC}"  # Default color (no color)
}

# Function to print warning messages
print_warning() {
    echo -e "${YELLOW}[WARNING] $1${NC}"
}

# Function to print warning messages
print_success() {
    echo -e "${GREEN}[SUCCESS] $1${NC}"
}

# Function to validate version format
validate_version() {
    if [[ $1 =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        return 0
    else
        return 1
    fi
}