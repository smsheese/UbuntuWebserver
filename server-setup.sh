#!/bin/bash

# Check if the script is run as root or with sudo
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root or with sudo."
  exit 1
fi

# Step 1: Update the hostname
read -p "Step 1: Update the hostname. Enter the new hostname: " new_hostname
echo "$new_hostname" > /etc/hostname
hostname -F /etc/hostname

# Step 2: Update server timezone
read -p "Step 2: Update the server timezone. Press Enter to continue..." 
dpkg-reconfigure tzdata

# Step 3: Update software packages
read -p "Step 3: Update software packages and remove unwanted. Press Enter to continue..."
apt update
apt upgrade -y
apt autoremove -y

# Step 4: Setup automatic security updates
read -p "Step 4: Setup automatic security updates. Press Enter to continue..."
apt install unattended-upgrades -y
dpkg-reconfigure unattended-upgrades
read -p "Step 4b: Edit the configuration file for automatic reboot. Press Enter to continue..."
sed -i 's/\/\/Unattended-Upgrade::Automatic-Reboot "false";/Unattended-Upgrade::Automatic-Reboot "true";/' /etc/apt/apt.conf.d/50unattended-upgrades

read -p "Enter the desired automatic reboot time in 24-hour format (e.g., 02:00): " reboot_time
sed -i "s/\/\/Unattended-Upgrade::Automatic-Reboot-Time \"02:00\";/Unattended-Upgrade::Automatic-Reboot-Time \"$reboot_time\";/" /etc/apt/apt.conf.d/50unattended-upgrades

read -p "Enter the desired interval (in days) for automatic updates (e.g., 7 for weekly): " update_interval
sed -i "s/APT::Periodic::Unattended-Upgrade \"1\";/APT::Periodic::Unattended-Upgrade \"$update_interval\";/" /etc/apt/apt.conf.d/20auto-upgrades

# Step 5: Setting up a new sudo user
read -p "Step 5: Add a new sudo user. Enter the username: " new_user
adduser $new_user
usermod -a -G sudo $new_user

# Step 5c: Setup public key authentication
read -p "Step 5c: Set up public key authentication. Press Enter to continue..."
mkdir -p /home/$new_user/.ssh
chmod 700 /home/$new_user/.ssh

read -p "Paste the public key for $new_user (follow the provided guide) and press Enter: " public_key
echo "$public_key" > /home/$new_user/.ssh/authorized_keys
chmod 600 /home/$new_user/.ssh/authorized_keys

# Step 6: Update SSH configuration for better security
read -p "Step 6: Update SSH configuration for better security. Press Enter to continue..."
sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
echo "Protocol 2" >> /etc/ssh/sshd_config
sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config

read -p "Enter a new SSH port (e.g., 33001): " new_ssh_port
sed -i "s/#Port 22/Port $new_ssh_port/" /etc/ssh/sshd_config

sed -i 's/X11Forwarding Yes/X11Forwarding No/' /etc/ssh/sshd_config

# Restart SSH server to apply changes
service ssh restart

# Step 7: Install and configure UFW
read -p "Step 7: Install and configure UFW (firewall). Do you want to continue (y/n)? " ufw_confirmation
if [ "$ufw_confirmation" == "y" ]; then
  apt install ufw -y
  sudo ufw allow http
  sudo ufw allow https
  if [ "$new_ssh_port" != "22" ]; then
    sudo ufw allow $new_ssh_port
  else
    sudo ufw allow ssh
  fi
  sudo ufw enable
fi

# Step 8: Setup fail2ban
read -p "Step 8: Setup fail2ban. Do you want to continue (y/n)? " fail2ban_confirmation
if [ "$fail2ban_confirmation" == "y" ]; then
  apt install fail2ban -y
  systemctl enable fail2ban
  systemctl start fail2ban
fi

echo "Script completed."
