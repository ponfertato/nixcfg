{ pkgs, pkgsUnstable, ... }:
{
  home.packages = with pkgs; [
    anydesk
    pkgsUnstable.mattermost-desktop
  ];
}
