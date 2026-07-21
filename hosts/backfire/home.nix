{ config, pkgs, ... }:
{
  imports = [
    ../../modules/home/common.nix
    ../../modules/home/graphical/plasma
    
    ../../modules/home/cli.nix
    ../../modules/home/gui-apps.nix
    # ../../modules/home/jetbrains.nix
    # ../../modules/home/nixvim.nix
    
    ../../modules/home/cyber.nix
    ../../modules/home/development.nix
    ../../modules/home/radio.nix
  ];

  home.username = "andy";
  home.homeDirectory = "/home/andy";
  home.stateVersion = "25.05";
}