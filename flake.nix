{
  description = "Ponfertato NixOS configuration with modular structure";

  inputs = {
    hardware.url = "github:NixOS/nixos-hardware/master";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
  };

  outputs =
    {
      hardware,
      nixpkgs,
      nixpkgs-unstable,
      self,
      ...
    }@inputs:
    let
      baseSystem = "x86_64-linux";

      unstableOverlay = final: prev: {
        unstable = import nixpkgs-unstable {
          system = baseSystem;
          config.allowUnfree = true;
        };
      };

      mkNixosConfig =
        {
          hostName,
          cpuModule,
          extraModules ? [ ],
        }:
        nixpkgs.lib.nixosSystem {
          system = baseSystem;
          specialArgs = { inherit inputs; };
          modules = [
            {
              nixpkgs.config.allowUnfree = true;
              nixpkgs.overlays = [ unstableOverlay ];
            }
            ./profiles/core
            (./hosts + "/${hostName}/default.nix")
            ./modules/docker.nix
            ./modules/flatpak.nix
            cpuModule
            /etc/nixos/configuration.nix
            /etc/nixos/hardware-configuration.nix
          ]
          ++ extraModules;
        };
    in
    {
      nixosConfigurations = {
        potatoWork = mkNixosConfig {
          hostName = "potatoWork";
          cpuModule = hardware.nixosModules.common-cpu-intel;
        };
        potatoLaptop = mkNixosConfig {
          hostName = "potatoLaptop";
          cpuModule = hardware.nixosModules.common-cpu-amd;
        };
      };
    };
}
