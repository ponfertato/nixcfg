{ pkgs, ... }:
{
  imports = [ ../../profiles/user/ponfertato ];

  boot.supportedFilesystems = [
    "ntfs"
    "exfat"
  ];

  boot.kernelParams = [
    "i915.enable_fbc=1"
    "i915.enable_guc=1"
    "i915.perf_stream_paranoid=0"
    "intel_pstate=active"
    "loglevel=3"
    "nowatchdog"
    "quiet"
    "splash"
    "video=VGA-1:1600x900@60"
  ];

  boot.kernel.sysctl = {
    "dev.i915.perf_stream_paranoid" = 0;
    "kernel.perf_event_paranoid" = 1;
    "vm.dirty_background_bytes" = 67108864;
    "vm.dirty_bytes" = 134217728;
    "vm.swappiness" = 10;
    "vm.vfs_cache_pressure" = 50;
  };

  environment.sessionVariables = {
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
    GDK_BACKEND = "wayland,x11";
    LANG = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
    LIBVA_DRIVER_NAME = "iHD";
    MOZ_ENABLE_WAYLAND = "1";
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    VDPAU_DRIVER = "va_gl";
    XDG_CURRENT_DESKTOP = "KDE";
    XDG_SESSION_TYPE = "wayland";
  };
  
  networking.hostName = "potatoWork";
  networking.interfaces.enp1s0.wakeOnLan.enable = true;

  services = {
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
    desktopManager.plasma6.enable = true;
    displayManager.plasma-login-manager.enable = true;
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

  hardware.cpu.intel.updateMicrocode = true;
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      intel-media-driver
      intel-vaapi-driver
      libva-vdpau-driver
    ];
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ kdePackages.xdg-desktop-portal-kde ];
    config.common.default = "*";
  };

  environment.systemPackages = with pkgs; [
    anydesk
    exfat
    exfatprogs
    kdePackages.partitionmanager
    unstable.mattermost-desktop
    unstable.rustdesk-flutter
  ];
}
