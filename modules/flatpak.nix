{
  config,
  pkgs,
  lib,
  ...
}:
{
  services.flatpak.enable = true;

  systemd.services.flatpak-repo = {
    description = "Add Flathub repository to Flatpak";
    wantedBy = [ "multi-user.target" ];
    after = [
      "network.target"
      "nss-lookup.target"
    ];
    requires = [ "network-online.target" ];
    path = [
      pkgs.flatpak
      pkgs.gnutls
      pkgs.curl
    ];
    script = ''
      if ! curl -f --connect-timeout 5 https://flathub.org > /dev/null 2>&1; then
        echo "No internet connection, skipping Flathub setup"
        exit 0
      fi

      if ! flatpak remotes | grep -q flathub; then
        echo "Adding Flathub repository..."
        flatpak remote-add --if-not-exists --system flathub https://flathub.org/repo/flathub.flatpakrepo
      else
        echo "Flathub repository already configured"
      fi
    '';
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      TimeoutStartSec = 30;
      Restart = "on-failure";
      RestartSec = "5s";
      StandardOutput = "journal";
      StandardError = "journal";
    };
  };
}
