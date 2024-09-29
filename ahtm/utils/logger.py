# ahtm/utils/logger.py

# ANSI escape codes for colors
RED = '\033[0;31m'      # Red for ERROR
GREEN = '\033[0;32m'    # Green for SUCCESS
YELLOW = '\033[0;33m'   # Yellow for WARNING
NC = '\033[0m'          # No Color

def log(message, level="INFO"):
    """Log a message with a specific level and color."""
    level = level.upper()
    
    # Determine the appropriate prefix and style based on level
    if level == "INFO":
        prefix = "[INFO   ]"
        style = NC  # No color
    elif level == "SUCCESS":
        prefix = "[SUCCESS]"
        style = GREEN
    elif level == "WARNING":
        prefix = "[WARNING]"
        style = YELLOW
    elif level == "ERROR":
        prefix = "[ERROR  ]"
        style = RED
    else:
        prefix = "[UNKNOWN]"
        style = NC  # No color

    # Print the log message with the appropriate color
    print(f"{style}{prefix} {message}{NC}")  # Reset color after message

# Helper functions for each log level
def print_info(message):
    log(message, level="INFO")

def print_success(message):
    log(message, level="SUCCESS")

def print_warning(message):
    log(message, level="WARNING")

def print_error(message):
    log(message, level="ERROR")