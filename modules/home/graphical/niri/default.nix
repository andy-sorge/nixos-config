{ pkgs, ... }:
{
  imports = [
    ./mako
    ./fuzzel
  ];
  
  home.packages = with pkgs; [
    swaybg
    
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
  ];
  
  programs.swaylock.enable = true;
  
  services.swayidle.enable = true;
  services.polkit-gnome.enable = true;
}