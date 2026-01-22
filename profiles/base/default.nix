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
        "https://cache.garnix.io/?priority=10"
        "https://cache.nixos.org/?priority=15"
        "https://nixos-cache-proxy.cofob.dev/?priority=20"
        "https://chaotic-nyx.cachix.org/?priority=30"
        "https://nix-community.cachix.org/?priority=40"
        "https://nix-gaming.cachix.org/?priority=50"
        "https://nixos.snix.store/?priority=100"
      ];
      
      trusted-public-keys = [
        "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
        "chaotic-nyx.cachix.org-1:HfnXSw4pj95iI/n17rIDy40agHj12WfF+Gqk6SonIT8="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
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
