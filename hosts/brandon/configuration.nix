{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];
  
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  networking.hostName = "brandon";
  
  # dont touch this idiot
  system.stateVersion = "25.05";
}
