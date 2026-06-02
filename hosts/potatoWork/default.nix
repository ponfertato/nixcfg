{ pkgs, ... }:
{
  imports = [ ../../profiles/user/ponfertato ];

  networking.hostName = "potatoWork";
  networking.interfaces.enp1s0.wakeOnLan.enable = true;

  environment.sessionVariables = {
    GDK_BACKEND = "wayland,x11";
    LANG = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
    MOZ_ENABLE_WAYLAND = "1";
    NIXOS_OZONE_WL = "1";
    PULSE_PROP = "media.role:music";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    SDL_VIDEODRIVER = "wayland";
    XDG_CURRENT_DESKTOP = "KDE";
    XDG_SESSION_TYPE = "wayland";
  };

  services = {
    desktopManager.plasma6.enable = true;
    displayManager.plasma-login-manager.enable = true;
    xserver = {
      enable = true;
      xkb.layout = "us,ru";
    };
    printing.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    openssh = {
      enable = true;
      openFirewall = true;
    };
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ kdePackages.xdg-desktop-portal-kde ];
    config.common.default = "*";
  };

  boot.supportedFilesystems = [
    "ntfs"
    "exfat"
  ];

  boot.kernelParams = [
    "i915.enable_fbc=1"
    "i915.enable_guc=2"
    "i915.enable_psr=2"
    "i915.perf_stream_paranoid=0"
    "intel_idle.max_cstate=4"
    "intel_pstate=active"
    "loglevel=3"
    "quiet"
    "splash"
    "video=VGA-1:1600x900@60"
  ];
  boot.kernel.sysctl = {
    "dev.i915.perf_stream_paranoid" = 0;
    "kernel.acpi_sci" = "edge";
    "kernel.perf_event_paranoid" = 1;
    "vm.dirty_background_ratio" = 5;
    "vm.dirty_ratio" = 15;
    "vm.swappiness" = 10;
    "vm.vfs_cache_pressure" = 50;
  };
  hardware.cpu.intel.updateMicrocode = true;
  services.displayManager.autoLogin.enable = false;

  environment.systemPackages = with pkgs; [
    anydesk
    exfat
    exfatprogs
    kdePackages.partitionmanager
    kdePackages.sddm-kcm
    unstable.mattermost-desktop
    unstable.rustdesk-flutter
  ];
}
