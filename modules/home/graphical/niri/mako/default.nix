{ pkgs, ... }:
{
  xdg.configFile."mako/config".source = ./config;
  
  home.packages = with pkgs; [
    libnotify
  ];
  
  services.mako = {
    enable = true;
  };
}