{ pkgs, lib, ... }:
{
  imports = [
    # ./plasma
    ./niri
    ./waybar
  ];
}