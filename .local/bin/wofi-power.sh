#!/bin/bash

# Iconos Nerd Font (Limpios y serios)
lock="   Bloquear"
reboot="   Reiniciar"
shutdown="   Apagar"

# Ejecutar Wofi
# Altura 175 para compensar el hueco fantasma de arriba con el padding de abajo
selected_option=$(echo -e "$lock\n$reboot\n$shutdown" | wofi --dmenu --cache-file /dev/null --prompt "" --name "powermenu" --width 250 --height 175 --style "${HOME}/.config/wofi/style-power.css")

# Acciones
case $selected_option in
"$lock")
  loginctl lock-session
  ;;
"$reboot")
  systemctl reboot
  ;;
"$shutdown")
  systemctl poweroff
  ;;
esac
