# <img src="https://upload.wikimedia.org/wikipedia/commons/2/28/Nix_snowflake.svg" width="50" height="50"> NixOS & Nix-on-Droid Modular Configuration
✨ **A modular Nix configuration with Flakes support for NixOS and Nix-on-Droid**
❄️ _Snowflake-inspired infrastructure for your systems_
---
## 🚀 Quick Start
### Requirements
- **For NixOS:** NixOS 25.05 (Warbler) or newer, Flakes enabled in `/etc/nixos/configuration.nix`:
  ```nix
  { nix.settings.experimental-features = [ "nix-command" "flakes" ]; }
  ```
- **For Nix-on-Droid:** Android device with Nix-on-Droid installed from F-Droid.
### Initial Setup on NixOS
```bash
# Generate hardware configuration
sudo rm -rf /etc/nixos/*; sudo nixos-generate-config
# Build and activate configuration
sudo nixos-rebuild switch --flake .#$(hostname) --impure
```
### Initial Setup on Nix-on-Droid (e.g., potatoPhone)
```bash
# Clone the repository
nix run nixpkgs#git -- clone https://codeberg.org/ponfertato/nixcfg ~/.config/nixpkgs
# Build and activate configuration for your device
nix-on-droid switch --flake ~/.config/nixpkgs#potatoPhone
```
---
## 📂 Structure
```text
nixcfg/
├── flake.nix                 # ❄️ Flakes entry point for NixOS and Nix-on-Droid
├── profiles/                 # 🧩 Modular system profiles (base, desktop, users, etc.)
│   ├── base/                 # 🖥️ Core system settings, Nix settings
│   ├── common/               # 👤 User configurations (groups, packages)
│   ├── desktop/              # 🖥️ Base GUI environment (KDE Plasma, X, audio, printing)
│   ├── laptop/               # 💻 Laptop-specific settings (Bluetooth, fingerprint)
│   ├── mobile/               # 📱 Common settings for Nix-on-Droid devices (packages, locale)
│   ├── networking/           # 🌐 Network and firewall settings
│   └── workstation/          # 💻 Workstation-specific settings (Wake-on-LAN)
├── hosts/                    # 🖥️ Host-specific configs (hostname, kernel params, user packages)
│   ├── potatoLaptop/         # 💻 Configuration for potatoLaptop
│   │   └── default.nix       # ⚙️ Host settings (hostname, kernelParams, packages)
│   ├── potatoWork/           # 💻 Configuration for potatoWork
│   │   └── default.nix       # ⚙️ Host settings (hostname, kernelParams, packages)
│   ├── potatoPhone/          # 📱 Configuration for potatoPhone (Nix-on-Droid)
│   │   └── default.nix       # ⚙️ Host settings (hostname, packages)
│   └── potatoTablet/         # 📱 Configuration for potatoTablet (Nix-on-Droid)
│       └── default.nix       # ⚙️ Host settings (hostname, packages)
└── modules/                  # 🧩 Reusable NixOS modules (Docker, Waydroid, Flatpak, Ollama, Home Manager)
    ├── docker.nix            # 🐳 Docker configuration module
    ├── flatpak.nix           # 📦 Flatpak configuration module
    ├── ollama.nix            # 🤖 Ollama service configuration module
    ├── waydroid.nix          # 🤖 Waydroid configuration module
    └── home-manager/         # 👤 Home Manager user environment
        ├── common.nix        # 🏠 Core settings (bash, git, firefox, aliases)
        ├── packages.nix      # 📦 User packages (apps, tools)
        ├── potatoLaptop.nix  # 💻 Configuration for potatoLaptop (host-specific packages)
        └── potatoWork.nix    # 💻 Configuration for potatoWork (host-specific packages)
```
---
## 🔄 Maintenance
### Full System Update (recommended)
```bash
nix-update-inputs && nix-apply-system && nix-apply-user
```
### Update Only User Environment (fast, no sudo)
```bash
nix-apply-user
```
### Update Only System (NixOS)
```bash
nix-apply-system
```
### Update Only Flake Inputs (dependencies)
```bash
nix-update-inputs
```
### Manual Update (if needed)
```bash
# Update flake inputs (nixpkgs, hardware, etc.)
nix flake update
# Rebuild and activate the system (NixOS) with hardware config regeneration
sudo nixos-generate-config && sudo nixos-rebuild switch --flake .#$(hostname) --impure
# Rebuild and activate the system (Nix-on-Droid)
nix-on-droid switch --flake .#<device_name>
```
### Garbage Collection
```bash
nix-gc
```
### Package Search
```bash
nix-search <package>          # in stable (nixos-25.05)
nix-search-unstable <package> # in unstable
```
---
## ✨ Key Features
- 🔄 **Automatic Updates**: Weekly GC and auto-upgrade (NixOS)
- 🧩 **Modular Design**: Easy to maintain and extend via profiles and separated modules
- 💻 **Multi-Device Support**: Share configs between NixOS and Nix-on-Droid machines
- 🛡️ **Reproducible Builds**: Fully declarative configuration with Flakes
- ⚙️ **Optimized Nix Settings**: Includes custom substituters for faster builds
- 👤 **Declarative User Environment**: Managed via Home Manager (apps, aliases, dotfiles)
---
## 🛠️ Customization
### Create New Profile
1. Add `profiles/new-profile/` directory.
2. Create `profiles/new-profile/default.nix` containing the NixOS or Nix-on-Droid module.
3. Import the profile in `flake.nix` for the desired host configuration.
### Create New Module
1. Add `modules/new-module.nix`.
2. Import the module in `flake.nix` for the desired host configuration.
### Hardware Configuration (NixOS only)
- Hardware-specific settings (kernel, CPU microcode, graphics drivers) are managed separately in `/etc/nixos/hardware-configuration.nix`.
- This file is typically generated by `nixos-generate-config` and can be manually edited or supplemented with `nixos-hardware` modules if needed.
- The configuration is included in `flake.nix` to ensure reproducibility and compatibility with `nixos-rebuild`.
### Manage User Environment
- Core settings (bash, git, firefox, aliases) are defined in:
  ```
  modules/home-manager/common.nix
  ```
- User packages are defined in:
  ```
  modules/home-manager/packages.nix
  ```
- Host-specific packages are defined in:
  ```
  modules/home-manager/potatoWork.nix
  modules/home-manager/potatoLaptop.nix
  ```
- After changes, apply with:
  ```bash
  nix-apply-user
  ```