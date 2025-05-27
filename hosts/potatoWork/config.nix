{ config, pkgs, ... }: {
  boot.kernelParams = [ "video=VGA-1:1600x900@60" ];

  networking = {
    hostName = "potatoWork";
    interfaces.enp1s0 = {
      wakeOnLan.enable = true;
    };
  };

  hardware.cpu.intel.updateMicrocode = true;

  services.displayManager.autoLogin.enable = false;

  users.users.ponfertato.packages = with pkgs; [
    anydesk
    v2rayn
  ];
}
