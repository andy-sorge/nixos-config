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

    powerManagement = {
      enable = true;
      finegrained = false;
    };

    open = true;

    nvidiaSettings = true;
  };

  # for docker
  hardware.nvidia-container-toolkit.enable = true;
  virtualisation.docker.enableNvidia = true;

  # dont touch this idiot
  system.stateVersion = "25.05";
}
