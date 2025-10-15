{ config, pkgs, ... }:

{
  networking.hostName = "potatoLaptop";

  boot.kernelParams = [ "amd_iommu=off" ];

  hardware.cpu.amd.updateMicrocode = true;

  services = {
    displayManager.autoLogin = {
      enable = true;
      user = "ponfertato";
    };
  };

  users.users.ponfertato.packages = with pkgs; [
    audacity
    heroic
    prismlauncher
    protonup-qt
  ];

  programs = {
    steam = {
      enable = true;
      gamescopeSession.enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
    gamemode.enable = true;
  };
}
