{ pkgs, ... }:
{
  home.packages = with pkgs; [
    chirp
    hamlib
    grig
    xastir
    direwolf
    aprx
  ];
}
