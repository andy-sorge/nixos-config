{pkgs, ...}:
{
  home.packages = with pkgs; [
    kitty
    ungoogled-chromium
    spotify
    remmina
    blender
    legcord
    signal-desktop
    libreoffice
    
    # niri stuff
    alacritty
    fuzzel
    
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