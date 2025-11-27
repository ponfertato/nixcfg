{ config, pkgs, ... }:
{
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        ControllerMode = "bredr";
      };
    };
    disabledPlugins = [ "sap" ];
  };

  services = {
    fprintd.enable = true;
  };
}
