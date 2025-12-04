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
      deltachat-desktop
      keepassxc
      nextcloud-client
      nextcloud-talk-desktop
      telegram-desktop
      vscodium
    ]);
}
