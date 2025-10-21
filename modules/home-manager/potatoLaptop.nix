{ pkgs, pkgsUnstable, ... }:
{
  imports = [
    ./packages.nix
  ];
  home.packages = with pkgs; [
    audacity
    pkgsUnstable.heroic
    pkgsUnstable.prismlauncher
    pkgsUnstable.protonup-qt
  ];
}
