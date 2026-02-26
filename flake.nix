{
  description = "main entry flake";
  
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    vicinae.url = "github:vicinaehq/vicinae";
  };
  
  outputs = { self , nixpkgs, home-manager, vicinae, ... }: {
    nixosConfigurations.brandon = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/brandon/configuration.nix
        
        ./modules/nixos/common.nix
        ./modules/nixos/laptop.nix
        ./modules/nixos/hyprland.nix
        
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.asorge = {
            imports = [
              ./hosts/brandon/home.nix
              vicinae.homeManagerModules.default
            ];
          };
        }
      ];
    };
  };
}