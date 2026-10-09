{ config, pkgs, ... }:
{
  networking.firewall = {
    enable = true;
    
    # allow necessary ports for ros2 networking
    allowedUDPPorts = [ 7400 7401 ];
    allowedUDPPortRanges = [
      { from = 7410; to = 7500; }
    ];
  };

  environment.systemPackages = with pkgs; [
    foxglove-studio
  ];
}