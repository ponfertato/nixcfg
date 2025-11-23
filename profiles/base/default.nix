{
  config,
  pkgs,
  lib,
  ...
}:
{
  time.timeZone = "Europe/Moscow";

  i18n = {
    defaultLocale = "ru_RU.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "ru_RU.UTF-8";
      LC_IDENTIFICATION = "ru_RU.UTF-8";
      LC_MEASUREMENT = "ru_RU.UTF-8";
      LC_MONETARY = "ru_RU.UTF-8";
      LC_NAME = "ru_RU.UTF-8";
      LC_NUMERIC = "ru_RU.UTF-8";
      LC_PAPER = "ru_RU.UTF-8";
      LC_TELEPHONE = "ru_RU.UTF-8";
      LC_TIME = "ru_RU.UTF-8";
    };
  };

  networking.networkmanager.enable = true;

  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };

  boot.kernelPackages = pkgs.linuxPackages_zen;

  nix = {
    settings = {
      auto-optimise-store = true;
      builders-use-substitutes = true;
      checkConfig = true;
      connect-timeout = 5;
      fallback = true;
      max-connections = 16;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      substituters = [
        "https://cache.garnix.io"
        "https://cache.nixos.org"
        "https://nixos.snix.store"
        "https://nixos-cache-proxy.cofob.dev"
      ];
      trusted-public-keys = [
        "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  boot.loader = {
    systemd-boot.configurationLimit = 5;
    # grub.configurationLimit = 5;
  };
}
