{ pkgs, ... }:
{
  imports = [
    # ./plasma
    ./niri
    ./waybar
  ];
  
  # just in case lol
  services.gnome-keyring.enable = false;
}