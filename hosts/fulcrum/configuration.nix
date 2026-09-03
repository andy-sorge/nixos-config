{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./power.nix
  ];

  networking.hostName = "fulcrum";

  # dont touch this idiot
  system.stateVersion = "25.05";
}
