{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "fulcrum";

  # dont touch this idiot
  system.stateVersion = "25.05";
}
