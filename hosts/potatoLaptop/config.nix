{ config, pkgs, inputs, ... }:
let
  pkgsUnstable = import inputs.nixpkgs-unstable {
    system = pkgs.stdenv.hostPlatform.system;
    config.allowUnfree = true;
  };
in {

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
    audacity
    heroic
    pkgsUnstable.amnezia-vpn
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
