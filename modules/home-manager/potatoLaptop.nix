{ pkgs, pkgsUnstable, ... }:
{
  home.packages = with pkgs; [
    audacity
    pkgsUnstable.heroic
    pkgsUnstable.prismlauncher
    pkgsUnstable.protonup-qt
  ];
}
