{ pkgs, ... }:
{
  home.packages = with pkgs; [
    chirp
    hamlib
    xastir
    direwolf
    aprx
  ];
}
