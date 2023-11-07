# Ubuntu Server Setup Script

## Description:
This Ubuntu Server Setup Script is designed to simplify the initial setup and security hardening of Ubuntu 22.04 LTS servers. It provides an interactive and user-friendly approach to configure essential server settings and enhance security. Whether you're setting up a new server or improving an existing one, this script streamlines the process and ensures your server is configured for optimal performance and protection.

## Key Features:
- **Hostname Update:** Easily update the server's hostname to your desired name.
- **Timezone Configuration:** An interactive setup to configure the server's timezone.
- **Package Management:** Update and clean software packages with a single confirmation, keeping your system up to date.
- **Automatic Security Updates:** Configure automatic security updates and reboot options, enhancing the server's security.
- **Sudo User Creation:** Add a new sudo user and set up public key authentication for secure access.
- **SSH Security Enhancements:** Secure SSH configuration, including options to change the SSH port and disable root login.
- **Firewall Setup (UFW):** Optionally install and configure the Uncomplicated Firewall (UFW) with predefined rules.
- **Fail2ban Installation:** Optionally install and enable Fail2ban to protect against unauthorized access attempts.

## Attribution:
The foundation of this script is based on Spinup WP's guide, available at [https://spinupwp.com/install-wordpress-ubuntu/](https://spinupwp.com/install-wordpress-ubuntu/), with modifications made to suit specific requirements and additional user experience enhancements.

## Compatibility:
- This script has been tested on Ubuntu 22.04 LTS, but it may work on other Debian/Ubuntu-based distributions as well.
- While the script is designed for Ubuntu, it might also be compatible with other Debian/Ubuntu-based systems. If you have tested it on other systems, please provide feedback or updates to the README.

## Usage:
To set up your Ubuntu server using this script, follow these steps:

1. **Download the Script:**
   - Click on the "Code" button at the top of this repository.
   - Select "Download ZIP" to download the script files to your local machine.
   - Alternatively, you can clone the repository using Git by running the following command:
     ```bash
     git clone https://github.com/smsheese/UbuntuWebserver.git
     ```

2. **Run the Script:**
   - Ensure that you have superuser privileges (either as the root user or using sudo).
   - Open your terminal and navigate to the directory where you downloaded or cloned the script.
   - Make the script executable by running the following command:
     ```bash
     chmod +x setup_server.sh
     ```
   - Run the script by executing:
     ```bash
     ./setup_server.sh
     ```
   - The script will guide you through the setup process and prompt you for user input at each step.

## Note:
Please exercise caution and review the prompts carefully, especially when modifying SSH and firewall settings. It's recommended to review the provided details before running the script to ensure it aligns with your server's requirements.

## Contributions and Issues:
Contributions and feedback are welcome. If you encounter any issues or have suggestions for improvements, please open an issue or submit a pull request.

Start configuring your Ubuntu server with confidence using this script and benefit from a secure and optimized server environment.
