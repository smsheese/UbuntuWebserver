**Ubuntu Server Setup Script**

**Description:**
This Ubuntu Server Setup Script is designed to simplify the initial setup and security hardening of Ubuntu 22.04 LTS servers. It provides an interactive and user-friendly approach to configure essential server settings and enhance security. Whether you're setting up a new server or improving an existing one, this script streamlines the process and ensures your server is configured for optimal performance and protection.

**Key Features:**
- **Hostname Update:** Easily update the server's hostname to your desired name.
- **Timezone Configuration:** An interactive setup to configure the server's timezone.
- **Package Management:** Update and clean software packages with a single confirmation, keeping your system up to date.
- **Automatic Security Updates:** Configure automatic security updates and reboot options, enhancing the server's security.
- **Sudo User Creation:** Add a new sudo user and set up public key authentication for secure access.
- **SSH Security Enhancements:** Secure SSH configuration, including options to change the SSH port and disable root login.
- **Firewall Setup (UFW):** Optionally install and configure the Uncomplicated Firewall (UFW) with predefined rules.
- **Fail2ban Installation:** Optionally install and enable Fail2ban to protect against unauthorized access attempts.

**Usage:**
This script can be executed by a superuser (root or with sudo privileges) and guides you through each step, prompting for user input where necessary. It ensures that your Ubuntu server is set up securely and efficiently, saving you time and effort.

**Note:**
Please exercise caution and review the prompts carefully, especially when modifying SSH and firewall settings. It's recommended to review the provided details before running the script to ensure it aligns with your server's requirements.

**Contributions and Issues:**
Contributions and feedback are welcome. If you encounter any issues or have suggestions for improvements, please open an issue or submit a pull request.

Start configuring your Ubuntu server with confidence using this script and benefit from a secure and optimized server environment.
