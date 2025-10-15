{ config, pkgs, ... }:

{
  services.ollama = {
    enable = true;
    openFirewall = true;
    loadModels = [
      "phi3:mini"
    ];
  };
}
