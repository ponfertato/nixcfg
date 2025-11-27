{
  description = "Ponfertato NixOS & Nix-on-Droid configuration with modular structure";

  inputs = {
    hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-on-droid = {
      url = "github:nix-community/nix-on-droid/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
  };
  outputs =
    {
      hardware,
      home-manager,
      nix-on-droid,
      nixpkgs,
      nixpkgs-unstable,
      self,
      ...
    }@inputs:
    let
      lib = nixpkgs.lib;
      baseSystem = "x86_64-linux";
      mobileSystem = "aarch64-linux";
      pkgsUnstable = import nixpkgs-unstable {
        system = baseSystem;
        config.allowUnfree = true;
      };
      hostSpecificProfiles = {
        potatoLaptop = [ ./profiles/laptop ];
        potatoWork = [ ./profiles/workstation ];
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
            (
              { ... }:
              {
                nixpkgs.config.allowUnfree = true;
              }
            )
            ./profiles/base
            ./profiles/common
            ./profiles/desktop
            ./profiles/networking
          ]
          ++ (hostSpecificProfiles.${hostName} or [ ])
          ++ [
            (./hosts + "/${hostName}/default.nix")
            ./modules/docker.nix
            ./modules/flatpak.nix
            /etc/nixos/configuration.nix
            /etc/nixos/hardware-configuration.nix
            cpuModule
          ]
          ++ extraModules;
        };
      mkNixOnDroidConfig =
        hostname: extraModules:
        nix-on-droid.lib.nixOnDroidConfiguration {
          pkgs = import nixpkgs { system = mobileSystem; };
          modules = [
            ./profiles/mobile/default.nix
            (./hosts + "/${hostname}/default.nix")
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
      homeConfigurations = {
        "ponfertato@potatoWork" = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            system = baseSystem;
            config.allowUnfree = true;
          };
          extraSpecialArgs = {
            inherit inputs pkgsUnstable;
            hostname = "potatoWork";
          };
          modules = [
            ./modules/home-manager/common.nix
            ./modules/home-manager/potatoWork.nix
          ];
        };
        "ponfertato@potatoLaptop" = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            system = baseSystem;
            config.allowUnfree = true;
          };
          extraSpecialArgs = {
            inherit inputs pkgsUnstable;
            hostname = "potatoLaptop";
          };
          modules = [
            ./modules/home-manager/common.nix
            ./modules/home-manager/potatoLaptop.nix
          ];
        };
      };
      nixOnDroidConfigurations = {
        potatoPhone = mkNixOnDroidConfig "potatoPhone" [ ];
        potatoTablet = mkNixOnDroidConfig "potatoTablet" [ ];
      };
    };
}
