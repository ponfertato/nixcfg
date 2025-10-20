{ config, pkgs, ... }: {
  home.username = "ponfertato";
  home.homeDirectory = "/home/ponfertato";
  home.stateVersion = "25.05";

  programs.bash.enable = true;
  programs.bash.shellAliases = {
    nixos-update = "cd ~/Документы/Git/nixcfg && git pull && nix flake update && sudo nixos-rebuild switch --flake .#$(hostname) --impure";
  };
}