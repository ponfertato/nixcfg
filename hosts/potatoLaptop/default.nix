{ pkgs, ... }:
{
  imports = [ ../../profiles/user/ponfertato ];

  networking.hostName = "potatoLaptop";

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings.General.ControllerMode = "bredr";
    disabledPlugins = [ "sap" ];
  };
  services.fprintd.enable = true;

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

  # --- Hardware Tweaks ---
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
  services.displayManager.autoLogin.enable = false;

  programs.steam = {
    enable = true;
    dedicatedServer.openFirewall = true;
    remotePlay.openFirewall = true;
  };

  environment.systemPackages = with pkgs; [
    exfat
    exfatprogs
    kdePackages.partitionmanager
    kdePackages.sddm-kcm
    unstable.heroic
    unstable.prismlauncher
    unstable.protonup-qt
  ];
}
