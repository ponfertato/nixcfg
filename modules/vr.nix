{
  config,
  lib,
  pkgs,
  ...
}:
{
  services.wivrn = {
    enable = true;
    autoStart = true;
    config = {
      enable = true;
      json = {
        application = [ pkgs.unstable.wayvr ];
      };
    };
    highPriority = true;
    monadoEnvironment = {
      XDG_CURRENT_DESKTOP = "KDE";
      XDG_SESSION_TYPE = "wayland";
      QT_QPA_PLATFORM = "wayland";
    };
    package = pkgs.unstable.wivrn;
    openFirewall = true;
    steam = {
      enable = true;
      importOXRRuntimes = true;
    };
  };

  environment.systemPackages = with pkgs; [
    unstable.sidequest
    unstable.wayvr
  ];
}
