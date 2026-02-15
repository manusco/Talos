#!/bin/bash
# ==============================================================================
# Agentic Stack Host Hardener
# ==============================================================================
# Description: Automates critical security hardening for Ubuntu VPS.
# Features:
# - Creates 'admin' user with sudo access.
# - Secures SSH: Port 5022, Key-Only Auth, No Root Login.
# - Installs UFW-Docker to fix Docker's firewall bypass vulnerability.
# - Installs Fail2Ban and Unattended Upgrades.
# - Installs Docker Engine & Compose.
# ==============================================================================

set -e

# --- Configuration ---
NEW_USER="admin"
SSH_PORT="5022"

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}=== Starting Agentic Stack Hardening ===${NC}"

# 1. Update System & Install Dependencies
echo "Updating system..."
apt update && apt upgrade -y
apt install -y ufw fail2ban curl git unzip htop software-properties-common unattended-upgrades

# 2. Configure Unattended Upgrades (Security Patches)
echo "Configuring automatic security updates..."
echo 'Unattended-Upgrade::Allowed-Origins { "${distro_id}:${distro_codename}-security"; }' > /etc/apt/apt.conf.d/50unattended-upgrades
dpkg-reconfigure -f noninteractive unattended-upgrades

# 3. Create Admin User
if id "$NEW_USER" &>/dev/null; then
    echo "User $NEW_USER already exists. Skipping creation."
else
    echo "Creating user $NEW_USER..."
    adduser --gecos "" --disabled-password $NEW_USER
    usermod -aG sudo $NEW_USER
    
    # We need the user to setup their own password or SSH key later if not provided,
    # but for now we assume the operator will add keys manually or via copy-id.
    
    mkdir -p /home/$NEW_USER/.ssh
    chmod 700 /home/$NEW_USER/.ssh
    touch /home/$NEW_USER/.ssh/authorized_keys
    chmod 600 /home/$NEW_USER/.ssh/authorized_keys
    chown -R $NEW_USER:$NEW_USER /home/$NEW_USER/.ssh
    
    echo -e "${RED}ACTION REQUIRED:${NC} Add your public key to /home/$NEW_USER/.ssh/authorized_keys NOW."
    echo "You can do this by running (from local): ssh-copy-id -p $SSH_PORT $NEW_USER@<server-ip>"
fi

# 4. Install Docker
if ! command -v docker &> /dev/null; then
    echo "Installing Docker..."
    curl -fsSL https://get.docker.com -o get-docker.sh
    sh get-docker.sh
    usermod -aG docker $NEW_USER
    rm get-docker.sh
else
    echo "Docker already installed."
fi

# 5. Fix Docker UFW Bypass (Critical Security)
if ! command -v ufw-docker &> /dev/null; then
    echo "Installing ufw-docker to secure container networking..."
    wget -O /usr/local/bin/ufw-docker https://github.com/chaifeng/ufw-docker/raw/master/ufw-docker
    chmod +x /usr/local/bin/ufw-docker
    ufw-docker install
else
    echo "ufw-docker already key installed."
fi

# 6. Configure Firewall (UFW)
echo "Configuring Firewall..."
ufw default deny incoming
ufw default allow outgoing
ufw allow $SSH_PORT/tcp
ufw allow 80/tcp
ufw allow 443/tcp

# 7. Harden SSH
echo "Hardening SSH..."
sed -i "s/#Port 22/Port $SSH_PORT/" /etc/ssh/sshd_config
sed -i "s/PermitRootLogin yes/PermitRootLogin no/" /etc/ssh/sshd_config
sed -i "s/PasswordAuthentication yes/PasswordAuthentication no/" /etc/ssh/sshd_config
sed -i "s/#PubkeyAuthentication yes/PubkeyAuthentication yes/" /etc/ssh/sshd_config

# 8. Configure Fail2Ban
echo "Configuring Fail2Ban..."
cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
sed -i "s/port    = ssh/port    = $SSH_PORT/" /etc/fail2ban/jail.local
systemctl restart fail2ban

echo -e "${GREEN}=== Hardening Complete ===${NC}"
echo "Please verify your SSH key is in place for '$NEW_USER' before rebooting!"
echo "New SSH Port: $SSH_PORT"
