{
  config,
  inputs,
  pkgs,
  ...
}:
{
  users.users.ponfertato = {
    isNormalUser = true;
    description = "ponfertato";
    extraGroups = [
      "adbusers"
      "audio"
      "cups"
      "docker"
      "flatpak"
      "gamemode"
      "input"
      "libvirt"
      "networkmanager"
      "plugdev"
      "scanner"
      "sshd"
      "video"
      "wheel"
    ];
  };
  programs = {
    kdeconnect.enable = true;
    obs-studio = {
      enable = true;
      enableVirtualCamera = true;
    };
  };
}
