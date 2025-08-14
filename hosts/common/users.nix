{ config, pkgs, ... }: {
  users.users.ponfertato = {
    isNormalUser = true;
    description = "ponfertato";
    extraGroups = [
      "adbusers"
      "audio"
      "cups"
      "docker"
      "flatpak"
      "gamemode"
      "input"
      "libvirt"
      "networkmanager"
      "plugdev"
      "scanner"
      "sshd"
      "video"
      "wheel"
    ];
    packages = with pkgs; [
      android-tools
      corefonts
      docker
      gimp
      git
      joplin-desktop
      kdePackages.kate
      kdePackages.tokodon
      keepassxc
      krita
      lazydocker
      lazygit
      libreoffice
      nextcloud-client
      nextcloud-talk-desktop
      qbittorrent
      remmina
      telegram-desktop
      thunderbird
      vlc
      vscodium
    ];
  };
  programs = {
    firefox = {
      enable = true;
      languagePacks = [
        "en-US"
        "ru"
      ];
    };
    kdeconnect.enable = true;
    obs-studio = {
      enable = true;
      enableVirtualCamera = true;
    };
  };
  nixpkgs.config.allowUnfree = true;
}