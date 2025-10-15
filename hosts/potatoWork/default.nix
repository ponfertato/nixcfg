{ config, pkgs, ... }:

{
  networking.hostName = "potatoWork";

  boot.kernelParams = [ "video=VGA-1:1600x900@60" ];

  hardware.cpu.intel.updateMicrocode = true;

  users.users.ponfertato.packages = with pkgs; [
    anydesk
    mattermost-desktop
  ];
}
