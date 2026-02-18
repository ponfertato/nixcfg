{
  config,
  inputs,
  pkgs,
  ...
}:
{
  networking.hostName = "potatoLaptop";

  boot.kernelParams = [
    "amd_pstate=active"
    "amdgpu.aspm=1"
    "amdgpu.dc=1"
    "amdgpu.dpm=1"
    "amdgpu.gpu_recovery=1"
    "amdgpu.runpm=1"
    "loglevel=3"
    "quiet"
    "splash"
  ];

  boot.kernel.sysctl = {
    "kernel.perf_event_paranoid" = 1;
    "vm.dirty_background_ratio" = 5;
    "vm.dirty_ratio" = 15;
    "vm.swappiness" = 10;
    "vm.vfs_cache_pressure" = 50;
  };

  hardware.cpu.amd.updateMicrocode = true;
  services.displayManager.autoLogin = {
    enable = false;
  };

  programs = {
    steam = {
      dedicatedServer.openFirewall = true;
      enable = true;
      remotePlay.openFirewall = true;
    };
  };
}
