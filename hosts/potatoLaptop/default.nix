{ pkgs, ... }:
{
  imports = [ ../../profiles/user/ponfertato ];

  boot.supportedFilesystems = [
    "ntfs"
    "exfat"
  ];

  boot.kernelParams = [
    "amd_pstate=active"
    "amdgpu.gpu_recovery=1"
    "amdgpu.runpm=1"
    "loglevel=3"
    "nowatchdog"
    "quiet"
    "splash"
  ];

  boot.kernel.sysctl = {
    "kernel.perf_event_paranoid" = 1;
    "vm.dirty_background_ratio" = 5;
    "vm.dirty_ratio" = 30;
    "vm.swappiness" = 1;
    "vm.vfs_cache_pressure" = 10;
  };

  environment.sessionVariables = {
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
    GDK_BACKEND = "wayland,x11";
    LANG = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
    LIBVA_DRIVER_NAME = "radeonsi";
    MOZ_ENABLE_WAYLAND = "1";
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    VDPAU_DRIVER = "radeonsi";
    XDG_CURRENT_DESKTOP = "KDE";
    XDG_SESSION_TYPE = "wayland";
  };

  hardware.bluetooth = {
    disabledPlugins = [ "sap" ];
    enable = true;
    powerOnBoot = true;
    settings.General.ControllerMode = "bredr";
  };

  networking.hostName = "potatoLaptop";

  services = {
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
    desktopManager.plasma6.enable = true;
    displayManager.plasma-login-manager.enable = true;
    fprintd.enable = true;
    openssh = {
      enable = true;
      openFirewall = true;
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    printing.enable = true;
    xserver = {
      enable = true;
      xkb.layout = "us,ru";
    };
  };

  hardware.cpu.amd.updateMicrocode = true;
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      mesa.drivers
      libvdpau-va-gl
    ];
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ kdePackages.xdg-desktop-portal-kde ];
    config.common.default = "*";
  };

  programs.steam = {
    enable = true;
    dedicatedServer.openFirewall = true;
    remotePlay.openFirewall = true;
  };

  environment.systemPackages = with pkgs; [
    exfat
    exfatprogs
    kdePackages.partitionmanager
    unstable.heroic
    unstable.prismlauncher
    unstable.protonup-qt
  ];
}
