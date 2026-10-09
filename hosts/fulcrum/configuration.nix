{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./power.nix
  ];

  myDesktop = "plasma";

  networking.hostName = "fulcrum";

  # dont touch this idiot
  system.stateVersion = "25.05";
}
