{ config, pkgs, ... }:
{
  environment.packages = with pkgs; [
    termux-api
  ];
}