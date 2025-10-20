{
  config,
  inputs,
  pkgs,
  ...
}:
{
  networking.hostName = "potatoWork";
  boot.kernelParams = [ "video=VGA-1:1600x900@60" ];
  hardware.cpu.intel.updateMicrocode = true;
}
