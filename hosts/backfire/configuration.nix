{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "backfire";

  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;

    powerManagement.enable = false;

    open = true;

    nvidiaSettings = true;
  };

  # dont touch this idiot
  system.stateVersion = "25.05";
}
