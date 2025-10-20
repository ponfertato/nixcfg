{ config, pkgs, ... }:
{
  hardware.bluetooth.enable = true;

  services = {
    fprintd.enable = true;
  };
}
