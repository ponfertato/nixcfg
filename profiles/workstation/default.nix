{ config, pkgs, ... }:
{
  networking.interfaces.enp1s0.wakeOnLan.enable = true;
}
