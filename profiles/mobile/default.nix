{ config, pkgs, ... }:
{
  environment.packages = with pkgs; [
    curl
    git
    lazygit
    nano
    openssh
    wget
  ];

  time.timeZone = "Europe/Moscow";

  i18n.defaultLocale = "ru_RU.UTF-8";
}
