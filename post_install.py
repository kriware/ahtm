import os
import shutil
from pathlib import Path

def post_install():
    source = Path(__file__).parent / 'tools'
    destination = Path('/usr/local/share/ahtm')

    if not destination.exists():
        os.makedirs(destination, exist_ok=True)

    for item in source.glob('*'):
        if item.is_dir():
            shutil.copytree(item, destination / item.name, dirs_exist_ok=True)
        else:
            shutil.copy2(item, destination)

    print("Post-installation completed. Tools copied to /usr/local/share/ahtm")

if __name__ == "__main__":
    post_install()
