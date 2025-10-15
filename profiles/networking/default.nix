{ config, pkgs, ... }:

{
  boot.kernel.sysctl = {
    "net.core.default_qdisc" = "fq";
    "net.core.rmem_max" = 134217728;
    "net.core.somaxconn" = 65535;
    "net.core.wmem_max" = 134217728;
    "net.ipv4.tcp_congestion_control" = "bbr";
    "net.ipv4.tcp_fastopen" = 3;
    "net.ipv4.tcp_fin_timeout" = 30;
    "net.ipv4.tcp_keepalive_time" = 1200;
    "net.ipv4.tcp_max_syn_backlog" = 65535;
    "net.ipv4.tcp_mtu_probing" = 1;
    "net.ipv4.tcp_rmem" = "4096 87380 134217728";
    "net.ipv4.tcp_syncookies" = 1;
    "net.ipv4.tcp_tw_reuse" = 1;
    "net.ipv4.tcp_wmem" = "4096 65536 134217728";
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
    "net.ipv6.conf.all.accept_redirects" = 0;
    "net.ipv6.conf.all.accept_source_route" = 0;
    "net.ipv6.conf.default.accept_redirects" = 0;
    "net.ipv6.conf.default.accept_source_route" = 0;
    "net.ipv4.tcp_low_latency" = 1;
    "kernel.sysrq" = 0;
    "kernel.core_uses_pid" = 1;
    "fs.suid_dumpable" = 0;
  };

  networking.firewall = {
    allowedTCPPorts = [
      21 # FTP
      25565 # Minecraft
      27015 # Steam (Source games)
      443 # HTTPS
      6567 # Mindustry
      80 # HTTP
    ];
    allowedUDPPorts = [
      27015 # Steam (Source games)
      6567 # Mindustry
    ];
  };
}
