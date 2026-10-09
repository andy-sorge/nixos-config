{
  description = "main entry flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    vicinae.url = "github:vicinaehq/vicinae";

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      plasma-manager,
      nixvim,
      vicinae,
      spicetify-nix,
      sops-nix,
      ...
    }@inputs:
    let
      mkHost =
        hostname:
        {
          system ? "x86_64-linux",
          user ? "andy",
          extraModules ? [ ],
        }:
        nixpkgs.lib.nixosSystem {
          inherit system;

          specialArgs = { inherit inputs system hostname user; };

          modules = [
            ./modules/system/common.nix
            ./hosts/${hostname}/configuration.nix
            ./modules/system/graphical

            sops-nix.nixosModules.sops

            { networking.hostName = hostname;}

            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                backupFileExtension = "backup";
                extraSpecialArgs = { inherit inputs; };
                sharedModules = [
                  vicinae.homeManagerModules.default
                  spicetify-nix.homeManagerModules.default
                  plasma-manager.homeModules.plasma-manager
                  nixvim.homeModules.default
                ];
                users.${user}.imports = [ ./hosts/${hostname}/home.nix ];
              };
            }
          ] ++ extraModules;
        };
    in
    {
      nixosConfigurations = {
        fulcrum = mkHost "fulcrum" {
          extraModules = [
            ./modules/system/steam.nix
            ./modules/system/ros.nix
            ./modules/system/docker.nix
          ];
        };

        backfire = mkHost "backfire" {
          extraModules = [
            ./modules/system/steam.nix
            ./modules/system/ros.nix
            ./modules/system/docker.nix
          ];
        };
      };
    };
}
