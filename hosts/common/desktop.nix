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

  boot = {
    loader = {
      systemd-boot.configurationLimit = 10;
      #grub.configurationLimit = 10;
    };
    supportedFilesystems = [ "ntfs" "exfat" ];
    kernelPackages = pkgs.linuxPackages_zen;
  };
}
