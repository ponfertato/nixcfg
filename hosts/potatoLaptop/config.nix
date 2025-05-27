{ config, pkgs, ... }: {

  boot.kernelParams = [ "amd_iommu=off" ];

  networking.hostName = "potatoLaptop";

  hardware.bluetooth.enable = true;
  hardware.cpu.amd.updateMicrocode = true;

  services = {
    displayManager.autoLogin = {
      enable = true;
      user = "ponfertato";
    };
    fprintd.enable = true;
  };

  users.users.ponfertato.packages = with pkgs; [
    ardour
    audacity
    distrho-ports
    heroic
    lmms
    prismlauncher
    protonup-qt
    v2rayn
    x42-avldrums
    x42-gmsynth
    x42-plugins
  ];

  programs = {
    steam = {
      gamescopeSession.enable = true;
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };
    gamemode.enable = true;
  };
}
