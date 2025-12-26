{ config, pkgs, ... }:
{
  services = {
    desktopManager.plasma6.enable = true;
    xserver = {
      enable = true;
      xkb.layout = "us,ru";
    };
    displayManager.sddm.wayland = {
      enable = true;
      compositor = "kwin";
    };
    printing.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    openssh = {
      enable = true;
      openFirewall = true;
    };
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };

  environment.systemPackages = with pkgs; [
    exfat
    exfatprogs
    kdePackages.partitionmanager
  ];

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      kdePackages.xdg-desktop-portal-kde
    ];
    config.common.default = "*";
  };

  boot = {
    supportedFilesystems = [
      "ntfs"
      "exfat"
    ];
  };
}
