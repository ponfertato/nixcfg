{
  config,
  pkgs,
  pkgsUnstable,
  ...
}:
{
  home.packages =
    (with pkgs; [
      android-tools
      corefonts
      gimp
      kdePackages.kate
      kdePackages.tokodon
      krita
      libreoffice
      qbittorrent
      remmina
      vlc
    ])
    ++ (with pkgsUnstable; [
      keepassxc
      nextcloud-client
      nextcloud-talk-desktop
      telegram-desktop
      vscodium
    ]);
}
