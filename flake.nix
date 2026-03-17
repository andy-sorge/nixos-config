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
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      plasma-manager,
      vicinae,
      ...
    }:
    {
      nixosConfigurations.brandon = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/brandon/configuration.nix

          ./modules/system/common.nix
          ./modules/system/laptop.nix
          ./modules/system/graphical

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.users.asorge = {
              imports = [
                ./hosts/brandon/home.nix
                vicinae.homeManagerModules.default
                plasma-manager.homeManagerModules.plasma-manager # change homeManagerModules -> homeModules at some point
              ];
            };
          }
        ];
      };
    };
}
