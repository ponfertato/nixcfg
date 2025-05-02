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
    # discord
    # teams
    audacity
    ardour
    heroic
    lmms
    prismlauncher
    protonup-qt
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
