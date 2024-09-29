![Alt text](ahtm.png)

# AHTM - Android Hacking Tools Manager

AHTM is my command-line tool designed to manage various Android hacking tools easily. It allows users to install, uninstall, and list tools with simple commands.

## Disclaimer

This is a personal tool I use to manage Android tools in my projects, as I often forget how to install some of them and/or it takes time to go through the installation process for many of them. All scripts that may affect the system when the tool is executed are located under the **tools/** folder (you can review them yourself). I know it’s not perfect and may have bugs, but it saves me time. In short, it works.
Docker has only been used for development

## Features

- **Install Tools**: Easily install popular Android hacking tools.
- **Uninstall Tools**: Remove tools that are no longer needed.
- **List Tools**: View all available tools and their installation status.

## Installation

### Prerequisites

- Python 3.6 or higher
- `pip3` (Python package installer)

### Clone the Repository

```bash
git clone https://github.com/kriware/ahtm.git
cd ahtm
```

### Install the Package

You can install easyly the package using `setup.py`:

```bash
sudo pip3 install -r requirements.txt
sudo python3 setup.py install
ahtm --install-completion # enable autocompletation
source ~/.<YOURSHELL>rc # enable autocompletation
```

## Usage

### Command-Line Interface

AHTM provides a simple command-line interface. You can use the following commands with sudo:

- **Install a Tool**:
  ```bash
  ahtm install <tool_name>
  ```

- **Uninstall a Tool**:
  ```bash
  ahtm uninstall <tool_name>
  ```

- **List Available Tools**:
  ```bash
  ahtm list_tools
  ```

### Example

To install `jadx`, you would run:

```bash
sudo ahtm install jadx
```

To uninstall it, you would run:

```bash
sudo ahtm uninstall jadx
```

To list all available tools:

```bash
ahtm list_tools
```


## Available Tools

- **`litecli`**: A command-line interface for SQLite databases, allowing you to interact with SQLite databases directly from the terminal.
- **`objection`**: Runtime mobile exploration toolkit, powered by Frida, used for dynamic analysis of mobile applications.
- **`frida`**: A dynamic instrumentation toolkit for developers, reverse-engineers, and security researchers, enabling the modification of running processes.
- **`pidcat`**: A script for filtering logcat output, making it easier to read logs from Android applications.
- **`apktool`**: A tool for reverse engineering Android APK files, allowing you to decode resources to nearly original form and rebuild them after making some modifications.
- **`platform-tools`**: Android SDK platform tools (adb, fastboot, etc.) used for debugging and managing Android devices.
- **`jadx`**: A dex to Java decompiler, allowing you to convert Android DEX files back to Java source code.
- **`reflutter`**: A tool for reverse engineering Flutter applications, enabling analysis and modification of Flutter apps.
- **`sqlitebrowser`**: A high-quality, open-source tool to create, design, and edit database files compatible with SQLite.
- **`java`**: The Java programming language, often required for running various Android tools and applications.

## TODO:

### Tools available in the early future
- **`zipalign`**
- **`imjtool`**
- **`r2frida`**
- **`apksigner`**
- **`mitmproxy`**
- **`medusa`**
- **`binder-trace`**
- **`fsmon`**
- **`scrcpy`**
- **`Runtime Mobile Security`**
- **`apk-medit`**
- **`apkdiff`**
- **`linpeas`**
- **`APKiD`**
- **`android-backup-extractor`**
- **`mobsf`**

### Future features
- Install a specific version on demand
- Check the installed version and verify if a new version is available

## Contributing

Contributions are welcome! Please feel free to submit a pull request or open an issue for any bugs or feature requests.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Thanks to the developers of the tools integrated into AHTM.
- Inspired by various open-source projects aimed at simplifying tool management.
