#!/usr/bin/env python3

import typer
from pathlib import Path
from typing import Dict, Tuple
from .utils.helpers import check_root, run_script, check_install
from .utils.logger import print_error

app = typer.Typer()

# Constants
TOOLS_DIR = Path("/usr/local/share/ahtm")
TOOLS: Dict[str, Tuple[Path, Path]] = {}

# ANSI escape codes for colors
BLUE = '\033[94m'  # Blue
GREEN = '\033[92m'  # Green
NC = '\033[0m'  # No Color

# Populate TOOLS dictionary
for tool_dir in TOOLS_DIR.iterdir():
    if tool_dir.is_dir():
        install_script = tool_dir / "install.sh"
        uninstall_script = tool_dir / "uninstall.sh"
        if install_script.is_file() and uninstall_script.is_file():
            TOOLS[tool_dir.name] = (install_script, uninstall_script)

@app.command()
def install(tool: str = typer.Argument(..., autocompletion=lambda: list(TOOLS.keys()))) -> None:
    """Install the specified tool."""
    check_root()
    if tool in TOOLS:
        script_path = TOOLS[tool][0]  # Install script
        run_script(script_path, f"Installing {tool}", f"Error installing {tool}")
    else:
        print_error(f"Tool {tool} not found.")
        raise typer.Exit(code=1)

@app.command()
def uninstall(tool: str) -> None:
    """Uninstall the specified tool."""
    check_root()
    if tool in TOOLS:
        script_path = TOOLS[tool][1]  # Uninstall script
        run_script(script_path, f"Uninstalling {tool}", f"Error uninstalling {tool}")
    else:
        print_error(f"Tool {tool} not found.")
        raise typer.Exit(code=1)

@app.command()
def list_tools():
    """List all available tools."""

    print(f"{BLUE}Available tools:{NC}")

    for tool in TOOLS:
        if check_install(tool):
            print(f" - {tool} ({GREEN}Installed{NC})")
        else:
            print(f" - {tool}")
"""
@app.command()
def install_completion():
    ""Install shell completion for the application.""
    typer.echo("Installing completion...")
    app.register_completion()

@app.command()
def show_completion():
    "Show completion options.
    typer.echo("Available completions...")
"""

if __name__ == "__main__":
    app()