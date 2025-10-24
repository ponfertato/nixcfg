{ pkgs, pkgsUnstable, ... }:
{
  imports = [
    ./packages.nix
  ];
  home.packages = with pkgs; [
    anydesk
    pkgsUnstable.mattermost-desktop
    pkgsUnstable.rustdesk-flutter
  ];
}
