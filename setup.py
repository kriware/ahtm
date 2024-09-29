from setuptools import setup, find_packages
import os
from setuptools.command.install import install
import subprocess


def read(fname):
    return open(os.path.join(os.path.dirname(__file__), fname)).read()

class CustomInstall(install):
    def run(self):
        install.run(self)
        subprocess.call(['python3', 'post_install.py'])
        print("To enable autocompletion, run")
        print("  ahtm --install-completion")
        print("  source ~/.YOURSHELLrc (example: source ~/.bashrc)")

setup(
    name="ahtm",
    version="0.1",
    author="kriware",
    description="A tool to manage Android Hacking Tools through CLI",
    long_description=read('README.md'),
    long_description_content_type="text/markdown",
    url="https://github.com/kriware/ahtm",
    packages=find_packages(),
    install_requires=[
        'typer',
    ],
    entry_points={
        'console_scripts': [
            'ahtm=ahtm.main:app',
        ],
    },
    package_data={
        'ahtm': ['tools/*/*.sh'],
    },
    include_package_data=True,
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: POSIX :: Linux", 
    ],
    python_requires='>=3.6',
    cmdclass={
        'install': CustomInstall,
    },
)
