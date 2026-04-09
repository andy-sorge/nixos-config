{ config, ... }:
{
  networking.firewall = {
    enable = true;
    allowedUDPPorts = [ 7400 7401 ];
    allowedUDPPortRanges = [
      { from = 7410; to = 7500; }
    ];
  };
}