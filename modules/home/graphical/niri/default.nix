{ pkgs, ... }:
{
  imports = [
    ./mako
    ./swayidle
    ./swaylock
  ];
  
  xdg.configFile."niri/config.kdl".source = ./config.kdl;
  
  home.packages = with pkgs; [
    swaybg
    swww
    imagemagick
    
    xwayland-satellite
    
    # dolphin
    kdePackages.dolphin
    kdePackages.qtsvg
    kdePackages.kio
    kdePackages.kio-fuse
    kdePackages.kio-extras
    kdePackages.xdg-desktop-portal-kde
    kdePackages.qt6ct
    kdePackages.breeze
    kdePackages.kimageformats
    kdePackages.kdegraphics-thumbnailers
    kdePackages.ffmpegthumbs
    kdePackages.qtimageformats
    kdePackages.ark
  ];
  
  services.polkit-gnome.enable = true;
}