{ config, pkgs, ... }: {
  users.users.ponfertato = {
    isNormalUser = true;
    description = "ponfertato";
    extraGroups = [ "networkmanager" "wheel" "docker" "adbusers" "flatpak" "sshd" "cups" "audio" "gamemode" ];
    packages = with pkgs; [
      android-tools
      corefonts
      docker
      gimp
      git
      joplin-desktop
      kdePackages.kate
      keepassxc
      krita
      libreoffice
      nextcloud-client
      nextcloud-talk-desktop
      qbittorrent
      remmina
      telegram-desktop
      thunderbird
      vscodium
    ];
  };
  programs = {
    firefox.enable = true;
    kdeconnect.enable = true;
  };
  nixpkgs.config.allowUnfree = true;
}