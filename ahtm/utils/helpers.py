import os
import subprocess
import typer
from .logger import print_info, print_error, print_success

def check_root():
    """Check if the script is running as root."""
    if os.geteuid() != 0:
        print_error("This script must be run as root. Please use sudo or run as root.")
        raise typer.Exit(code=1)

def check_install(tool):
    """Check if the specified tool is installed."""
    special_cases = {
        "platform-tools": lambda: os.path.isdir("/usr/local/bin/platform-tools"),
    }

    if tool in special_cases:
        return special_cases[tool]()

    try:
        result = subprocess.run(["which", tool], capture_output=True, text=True)
        return bool(result.stdout.strip())
    except (subprocess.CalledProcessError, FileNotFoundError):
        return False

def run_script(script_path, success_message, error_message):
    """Run a shell script and handle the output."""
    print_info(f"{success_message}...")
    try:
        subprocess.run(f"bash {script_path}", shell=True, check=True)
    except subprocess.CalledProcessError:
        raise typer.Exit(code=1)
    
    print_success(f"{success_message} completed successfully.")