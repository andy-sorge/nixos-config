{config, pkgs, ...}:
{
  home.packages = with pkgs; [
    kitty 
    
    # utils
    hyprpaper
    hyprcursor
    hyprshot
    hyprpanel
    
    # app theming etc.
    nwg-look
    qt6Packages.qt6ct
  ];
} 