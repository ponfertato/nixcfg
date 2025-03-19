{ config, pkgs, ... }: {
  networking.hostName = "potatoWork";

  hardware.cpu.amd.updateMicrocode = true;

  services.displayManager.autoLogin.enable = false;

  users.users.ponfertato.packages = with pkgs; [
    anydesk
    rustdesk
    skypeforlinux
  ];
}
