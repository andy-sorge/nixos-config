{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "backfire";

  # dont touch this idiot
  system.stateVersion = "25.05";
}
