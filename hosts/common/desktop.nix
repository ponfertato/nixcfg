{ config, pkgs, ... }: {
  services = {
    xserver = {
      enable = true;
      xkb.layout = "us,ru";
    };
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
    printing.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
    };
    openssh.enable = true;
  };

  environment.systemPackages = with pkgs; [
    exfat
    exfatprogs
    kdePackages.partitionmanager
  ];

  boot = {
    supportedFilesystems = [ "ntfs" "exfat" ];
    kernelPackages = pkgs.linuxPackages_zen;
  };
}