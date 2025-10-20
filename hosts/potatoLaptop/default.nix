{
  config,
  inputs,
  pkgs,
  ...
}:
{
  networking.hostName = "potatoLaptop";
  boot.kernelParams = [ "amd_iommu=off" ];
  hardware.cpu.amd.updateMicrocode = true;
  services.displayManager.autoLogin = {
    enable = true;
    user = "ponfertato";
  };

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
