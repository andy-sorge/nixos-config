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
      ...
    }@inputs:
    {
      nixosConfigurations = {
        fulcrum = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/fulcrum/configuration.nix
  
            ./modules/system/common.nix
            ./modules/system/graphical
            
            ./modules/system/steam.nix
            ./modules/system/ros.nix
            ./modules/system/docker.nix
  
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "backup";
              home-manager.extraSpecialArgs = { inherit inputs; };
              home-manager.users.andy = {
                imports = [
                  ./hosts/fulcrum/home.nix
                  vicinae.homeManagerModules.default
                  spicetify-nix.homeManagerModules.default
                  plasma-manager.homeModules.plasma-manager
                  nixvim.homeModules.default
                ];
              };
            }
          ];
        };

        backfire = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/backfire/configuration.nix
  
            ./modules/system/common.nix
            ./modules/system/graphical
            
            ./modules/system/steam.nix
            ./modules/system/ros.nix
            ./modules/system/docker.nix
  
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "backup";
              home-manager.extraSpecialArgs = { inherit inputs; };
              home-manager.users.andy = {
                imports = [
                  ./hosts/backfire/home.nix
                  vicinae.homeManagerModules.default
                  spicetify-nix.homeManagerModules.default
                  plasma-manager.homeModules.plasma-manager
                  nixvim.homeModules.default
                ];
              };
            }
          ];
        };
      };
    };
}
