{ config, pkgs, ... }:
{
  services.flatpak.enable = true;

  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      if ! flatpak remote-info --if-unknown flathub > /dev/null 2>&1; then
        flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
      fi
    '';
  };
}
