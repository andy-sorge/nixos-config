{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "brandon";

  # dont touch this idiot
  system.stateVersion = "25.05";
}
