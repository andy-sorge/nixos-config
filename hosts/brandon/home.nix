{ config, pkgs, ... }:
{
  imports = [
    ../../modules/home/common.nix
    # ../../modules/home/hyprland.nix
    ../../modules/home/plasma.nix
    
    ../../modules/home/cli.nix
    ../../modules/home/graphical.nix
    
    ../../modules/home/cyber.nix
    ../../modules/home/development.nix
  ];

  home.username = "asorge";
  home.homeDirectory = "/home/asorge";
  home.stateVersion = "25.05";
}