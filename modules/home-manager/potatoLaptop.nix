{ pkgs, pkgsUnstable, ... }:
{
  imports = [
    ./packages.nix
  ];
  home.packages = with pkgs; [
    pkgsUnstable.heroic
    pkgsUnstable.prismlauncher
    pkgsUnstable.protonup-qt
  ];
}
