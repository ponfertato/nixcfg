{ pkgs, ... }:
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

  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot = {
      enable = true;
      configurationLimit = 5;
    };
  };

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

  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };

  networking.networkmanager = {
    enable = true;
    plugins = with pkgs; [
      networkmanager-openconnect
      networkmanager-vpnc
    ];
  };

  boot.kernel.sysctl = {
    "fs.suid_dumpable" = 0;
    "kernel.core_uses_pid" = 1;
    "kernel.sysrq" = 0;
    "net.core.default_qdisc" = "fq";
    "net.core.rmem_max" = 134217728;
    "net.core.somaxconn" = 65535;
    "net.core.wmem_max" = 134217728;
    "net.ipv4.conf.all.accept_redirects" = 0;
    "net.ipv4.conf.all.accept_source_route" = 0;
    "net.ipv4.conf.all.log_martians" = 1;
    "net.ipv4.conf.all.rp_filter" = 1;
    "net.ipv4.conf.all.secure_redirects" = 0;
    "net.ipv4.conf.all.send_redirects" = 0;
    "net.ipv4.conf.default.accept_redirects" = 0;
    "net.ipv4.conf.default.accept_source_route" = 0;
    "net.ipv4.conf.default.log_martians" = 1;
    "net.ipv4.conf.default.rp_filter" = 1;
    "net.ipv4.conf.default.secure_redirects" = 0;
    "net.ipv4.conf.default.send_redirects" = 0;
    "net.ipv4.icmp_echo_ignore_broadcasts" = 1;
    "net.ipv4.icmp_ignore_bogus_error_responses" = 1;
    "net.ipv4.ip_local_port_range" = "1024 65535";
    "net.ipv4.tcp_congestion_control" = "bbr";
    "net.ipv4.tcp_fastopen" = 3;
    "net.ipv4.tcp_fin_timeout" = 30;
    "net.ipv4.tcp_keepalive_time" = 1200;
    "net.ipv4.tcp_low_latency" = 1;
    "net.ipv4.tcp_max_syn_backlog" = 65535;
    "net.ipv4.tcp_mtu_probing" = 1;
    "net.ipv4.tcp_rmem" = "4096 87380 134217728";
    "net.ipv4.tcp_syncookies" = 1;
    "net.ipv4.tcp_tw_reuse" = 1;
    "net.ipv4.tcp_wmem" = "4096 65536 134217728";
    "net.ipv6.conf.all.accept_redirects" = 0;
    "net.ipv6.conf.all.accept_source_route" = 0;
    "net.ipv6.conf.default.accept_redirects" = 0;
    "net.ipv6.conf.default.accept_source_route" = 0;
  };

  networking.firewall = {
    allowedTCPPorts = [
      21 # FTP
      25565 # Minecraft
      27015 # Steam
      3389 # RDP
      443 # HTTPS
      6567 # Mindustry
      80 # HTTP
    ];
    allowedUDPPorts = [
      27015 # Steam
      3389 # RDP
      6567 # Mindustry
    ];
  };
}
