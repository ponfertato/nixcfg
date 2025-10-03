{ config, pkgs, ... }:
{
  services = {
    xserver = {
      enable = true;
      xkb.layout = "us,ru";
    };
    blocky = {
      enable = true;
      settings = {
        ports = {
          dns = "53";
          tls = "853";
          https = "443";
        };
        minTlsServeVersion = "1.3";
        connectIPVersion = "dual";
        upstreams = {
          groups = {
            default = [
              "https://one.one.one.one/dns-query"
              "https://dns.google/dns-query"
            ];
          };
          strategy = "parallel_best";
          timeout = "5s";
        };
        bootstrapDns = {
          upstream = "https://one.one.one.one/dns-query";
          ips = ["1.1.1.1" "1.0.0.1"];
        };
        blocking = {
          denylists = {
            ads = [
              "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts"
              "https://schakal.ru/hosts/hosts.txt"
            ];
          };
          clientGroupsBlock = {
            default = [ "ads" ];
          };
          blockType = "nxDomain";
          blockTTL = "1h";
        };
        caching = {
          minTime = "5m";
          maxTime = "1h";
          prefetching = true;
          cacheTimeNegative = "15m";
        };
        ede.enable = true;
        ecs = {
          ipv4Mask = 24;
          ipv6Mask = 56;
        };
        fqdnOnly.enable = true;
      };
    };
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
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

  environment.systemPackages = with pkgs; [
    exfat
    exfatprogs
    kdePackages.partitionmanager
  ];

  boot = {
    loader = {
      systemd-boot.configurationLimit = 10;
      #grub.configurationLimit = 10;
    };
    supportedFilesystems = [
      "ntfs"
      "exfat"
    ];
    kernelPackages = pkgs.linuxPackages_zen;
  };
}
