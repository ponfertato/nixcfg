{ config, pkgs, ... }:
{
  fonts.packages = with pkgs; [
    corefonts
    dejavu_fonts
    freefont_ttf
    liberation_ttf
    nerd-fonts.fira-code
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
    unifont
  ];
}