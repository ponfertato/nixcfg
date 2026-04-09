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

  networking.networkmanager = {
    enable = true;
    plugins = [
      pkgs.networkmanager-openconnect
      pkgs.networkmanager-vpnc
    ];
  };

  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };

  boot.kernelPackages = pkgs.linuxPackages_zen;

  nix = {
    checkConfig = true;
    settings = {
      auto-optimise-store = true;
      builders-use-substitutes = true;
      connect-timeout = 5;
      download-attempts = 3;
      fallback = true;
      http-connections = 16;
      stalled-download-timeout = 30;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      substituters = [
        "https://mirror.yandex.ru/nixos/?priority=5"
        "https://cache.nixos.org/?priority=10"
      ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot = {
      configurationLimit = 5;
      enable = true;
    };
  };
}
