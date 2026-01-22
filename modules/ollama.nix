{ config, pkgs, ... }:
{
  services.ollama = {
    enable = true;
    openFirewall = true;
    loadModels = [
      "phi4-mini"
    ];
  };
}
