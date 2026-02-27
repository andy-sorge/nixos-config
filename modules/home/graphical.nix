{pkgs, ...}:
{
  home.packages = with pkgs; [
    kitty
    google-chrome
    discord
    spotify
    remmina
    chirp
    
    # dolphin and deps
    kdePackages.qtsvg
    kdePackages.dolphin
    kdePackages.kio
    kdePackages.kio-fuse
    kdePackages.kio-extras
    
    nerd-fonts.jetbrains-mono
  ];
  
  services.vicinae = {
    enable = true;
    systemd = {
      enable = true;
      autoStart = true;
      environment = {
        USE_LAYER_SHELL = 1;
      };
    };
  };
}