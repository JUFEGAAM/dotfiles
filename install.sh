#!/bin/bash

# -----------------------------------------------------------------------------
#  🦇 GOTHAM DOTFILES INSTALLER
#  Minimalist, Dark & Fast Hyprland Setup on CachyOS
#  Author: JUFEGAAM
# -----------------------------------------------------------------------------

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Clear screen and show banner
clear
echo -e "${BLUE}   ▄████  ▒█████  ▄▄▄█████▓ ██░ ██  ▄▄▄       ███▄ ▄███▓${NC}"
echo -e "${BLUE}  ██▒ ▀█▒▒██▒  ██▒▓  ██▒ ▓▒▓██░ ██▒▒████▄    ▓██▒▀█▀ ██▒${NC}"
echo -e "${BLUE} ▒██░▄▄▄░▒██░  ██▒▒ ▓██░ ▒░▒██▀▀██░▒██  ▀█▄  ▓██    ▓██░${NC}"
echo -e "${BLUE} ░▓█  ██▓▒██   ██░░ ▓██▓ ░ ░▓█ ░██ ░██▄▄▄▄██ ▒██    ▒██ ${NC}"
echo -e "${BLUE} ░▒▓███▀▒░ ████▓▒░  ▒██▒ ░ ░▓█▒░██▓ ▓█   ▓██▒▒██▒   ░██▒${NC}"
echo -e "${BLUE}  ░▒   ▒ ░ ▒░▒░▒░   ▒ ░░    ▒ ░░▒░▒ ▒▒   ▓▒█░░ ▒░   ░  ░${NC}"
echo -e "${BLUE}   ░   ░   ░ ▒ ▒░     ░     ▒ ░▒░ ░  ▒   ▒▒ ░░  ░      ░${NC}"
echo -e "${BLUE} ░ ░   ░ ░ ░ ░ ▒    ░       ░  ░░ ░  ░   ▒   ░      ░   ${NC}"
echo -e "${BLUE}       ░     ░ ░            ░  ░  ░      ░  ░       ░   ${NC}"
echo ""
echo -e "${BLUE}  🦇 Welcome to Gotham Setup${NC}"
echo -e "${YELLOW}  -----------------------------------------------------${NC}"
echo -e "  This script will install necessary packages and apply your configuration."
echo ""
echo -e "  ${RED}⚠️  Warning:${NC} A backup of your current configs will be created."
echo ""
echo -e "  Press ${GREEN}ENTER${NC} to start installation..."
read -r

# -----------------------------------------------------------------------------
# 1. SYSTEM UPDATE
# -----------------------------------------------------------------------------
echo -e "\n${BLUE}[+] Updating system (pacman)...${NC}"
if ! sudo pacman -Syu --noconfirm; then
  echo -e "${RED}[!] Error updating system. Aborting.${NC}"
  exit 1
fi

# -----------------------------------------------------------------------------
# 2. PACKAGE INSTALLATION
# -----------------------------------------------------------------------------
echo -e "\n${BLUE}[+] Installing essential packages...${NC}"

# Package list
PACKAGES=(
  # Desktop Environment & Utilities
  hyprland
  waybar
  wofi
  rofi-wayland # Optional if you decide to use it later
  hyprpaper
  hyprlock
  hypridle

  # Terminal & Files
  ghostty
  yazi
  neovim

  # Yazi Dependencies (Previews)
  ffmpeg
  7zip
  jq
  poppler
  fd
  ripgrep
  fzf
  zoxide
  imagemagick

  # System Utilities
  wl-clipboard
  cliphist
  grim
  slurp
  satty
  network-manager-applet
  pavucontrol
  brightnessctl
  playerctl

  # Dotfiles Management & Base
  stow
  git
  base-devel

  # Fonts & Icons
  ttf-jetbrains-mono-nerd
  noto-fonts-emoji

  # Others (npm for nvim plugins)
  nodejs
  npm
)

sudo pacman -S --needed --noconfirm "${PACKAGES[@]}"

# -----------------------------------------------------------------------------
# 3. BACKUP EXISTING CONFIGURATIONS
# -----------------------------------------------------------------------------
echo -e "\n${BLUE}[+] Creating backups...${NC}"
TIMESTAMP=$(date +%Y%m%d-%H%M%S)
BACKUP_DIR=~/dotfiles-backup-$TIMESTAMP
mkdir -p "$BACKUP_DIR"

# Folders to overwrite
CONFIGS=(hypr waybar wofi rofi ghostty nvim yazi)

for config in "${CONFIGS[@]}"; do
  if [ -d "$HOME/.config/$config" ]; then
    echo -e "    - Backing up $config..."
    mv "$HOME/.config/$config" "$BACKUP_DIR/"
  fi
done

echo -e "${GREEN}    Backup saved at: $BACKUP_DIR${NC}"

# -----------------------------------------------------------------------------
# 4. APPLY STOW (SYMLINKS)
# -----------------------------------------------------------------------------
echo -e "\n${BLUE}[+] Applying Gotham configurations...${NC}"

# Create base folders if they don't exist
mkdir -p ~/.config
mkdir -p ~/.local/bin
mkdir -p ~/Screenshots

# Ensure we are in the script's directory
cd "$(dirname "$0")" || exit

# Apply Stow (creates magic links)
stow .

echo -e "${GREEN}    Links created successfully.${NC}"

# -----------------------------------------------------------------------------
# 5. FINAL TWEAKS
# -----------------------------------------------------------------------------
echo -e "\n${BLUE}[+] Final adjustments...${NC}"

# Execution permissions for scripts
chmod +x ~/.local/bin/wofi-power.sh 2>/dev/null

# Force Dark Theme on GTK apps (for Yazi/Nautilus and system windows)
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark' 2>/dev/null

# -----------------------------------------------------------------------------
# FINISHED
# -----------------------------------------------------------------------------
echo -e "\n${BLUE}┌──────────────────────────────────────────────┐${NC}"
echo -e "${BLUE}│      🦇 GOTHAM INSTALLATION COMPLETED 🦇     │${NC}"
echo -e "${BLUE}└──────────────────────────────────────────────┘${NC}"
echo ""
echo -e "  To see all changes applied:"
echo -e "  1. ${YELLOW}Reboot your computer${NC} or log out (Super + Shift + M)"
echo -e "  2. Make sure to select Hyprland at login."
echo ""
echo -e "  Enjoy your new environment! 🌑"
