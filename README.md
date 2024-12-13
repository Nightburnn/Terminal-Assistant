# Terminal Assistant

A customizable Bash terminal assistant that enhances productivity by providing interactive options and task automation directly in your terminal.

## Features

- **Time-based Greetings**: Personalized greetings based on the time of day.
- **Interactive Menu**: Choose from options like:
  - Creating directories
  - Executing commands
- **Automated Task Execution**: Simplifies common tasks directly from your terminal.

## Installation

### Prerequisites

Ensure you have the following installed:
- **Bash Shell** (Default on most Linux distributions)
- **Git**: For cloning this repository (install with `sudo apt install git` or equivalent)

### Automatic Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/Nightburnn/Terminal-Assistant
   cd terminal-assistant

2.Run the installation script:
   ```bash
   bash install_dependencies.sh
 ```
3. Add the assistant to your .bashrc:
```bash
  echo 'source ~/terminal-assistant/.bashrc' >> ~/.bashrc
  source ~/.bashrc
```
4. Start using the assistant:
```bash
   terminal_assistant
```

### Manual Installation

Copy the .bashrc content from this repository to your local .bashrc:
```bash
cp ./bashrc ~/.bashrc
```
Reload the .bashrc file:
```bash
    source ~/.bashrc
```
## Usage

After installation, simply type terminal_assistant in your terminal to launch the program.

## Project Structure

Here’s how the repository is organized:
```bash
terminal-assistant/
├── .bashrc                  # Contains the Terminal Assistant function
├── install_dependencies.sh  # Automates dependency installation
├── README.md                # Documentation
├── LICENSE                  # License file
```

## Contributing

Contributions are welcome! Please fork this repository, make your changes, and submit a pull request.

### License

This project is licensed under the MIT License. See the LICENSE file for details.
```bash
### Why Include the Project Structure?

- **For Developers**: Helps understand the file organization at a glance.
- **For New Contributors**: Gives them an overview of where to find or add specific files.

You can add the **Project Structure** anywhere in the README, but it's commonly placed:
- **Before "Contributing"**: Ideal for technical documentation.
- **After "Usage"**: If the structure is straightforward and easy to navigate.

```
