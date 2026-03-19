{ config, pkgs, ... }:
{
  imports = [
    ../../modules/home/common.nix
    ../../modules/home/graphical
    
    ../../modules/home/cli.nix
    ../../modules/home/gui-apps.nix
    
    ../../modules/home/cyber.nix
    ../../modules/home/development.nix
    ../../modules/home/radio.nix
  ];

  home.username = "asorge";
  home.homeDirectory = "/home/asorge";
  home.stateVersion = "25.05";
}