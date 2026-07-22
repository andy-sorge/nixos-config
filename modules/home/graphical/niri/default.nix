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
    awww
    imagemagick
    
    iwgtk
    impala
    
    xwayland-satellite
    
    inter
    
    # dolphin
    kdePackages.dolphin
    kdePackages.dolphin-plugins
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
  
  fonts.fontconfig.enable = true;
  
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "image/png" = "org.kde.gwenview.desktop";
      "image/jpg" = "org.kde.gwenview.desktop";
      "image/jpeg" = "org.kde.gwenview.desktop";
      "application/pdf" = "";
    };
  };
}