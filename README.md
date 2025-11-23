## My Dotfiles - CachyOS + Hyprland

### System Specs:

```text
           .-------------------------:                    juanito@batman
          .+=========================.                    --------------
         :++===++==================-       :++-           OS: CachyOS x86_64
        :*++====+++++=============-        .==:           Host: MS-7C94 (1.0)
       -*+++=====+***++==========:                        Kernel: Linux 6.17.8-2-cachyos
      =*++++========------------:                         Uptime: 2 hours, 9 mins
     =*+++++=====-                     ...                Packages: 1101 (pacman)
   .+*+++++=-===:                    .=+++=:              Shell: fish 4.2.1
  :++++=====-==:                     -*****+              Display (27G2G4): 1920x1080 in 27", 144 Hz [External]
 :++========-=.                      .=+**+.              WM: Hyprland 0.52.1 (Wayland)
.+==========-.                          .                 Cursor: Adwaita
 :+++++++====-                                .--==-.     Terminal: ghostty 1.2.3-arch2.1
  :++==========.                             :+++++++:    Terminal Font: JetBrainsMono Nerd Font (12pt)
   .-===========.                            =*****+*+    CPU: AMD Ryzen 7 5800X (16) @ 4.85 GHz
    .-===========:                           .+*****+:    GPU: NVIDIA GeForce RTX 4070 SUPER [Discrete]
      -=======++++:::::::::::::::::::::::::-:  .---:      Memory: 2.44 GiB / 15.54 GiB (16%)
       :======++++====+++******************=.             Swap: 528.00 KiB / 15.54 GiB (0%)
        :=====+++==========++++++++++++++*-               Disk (/): 103.48 GiB / 929.51 GiB (11%) - btrfs
         .====++==============++++++++++*-                Local IP (wlan0): 172.30.1.4/24
          .===+==================+++++++:                 Locale: en_US.UTF-8
           .-=======================+++:
             ..........................
```

## Automatic Installation

### To install this configuration (Gotham) on a fresh CachyOS/Hyprland system:

1. **Clone the repository:**

```
git clone https://github.com/JUFEGAAM/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

2. **Run the installer:**

```
./install.sh
```

**The script will handle:**

- Installing necessary packages (Hyprland, Waybar, Yazi, etc.).

- Setting up configurations

- Setting up themes and permissions.

- A fresh Hyprland setup with all the configurations well explained and easy to change

***Note: Restart your system after installation to apply all changes.***
