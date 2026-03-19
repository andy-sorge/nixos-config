{ pkgs, ... }:
{
  xdg.configFile."fuzzel/fuzzel.ini".source = ./fuzzel.ini;
  
  programs.fuzzel.enable = true;
}