{pkgs, ...}:
{
  home.packages = with pkgs; [
    kitty
    google-chrome
    ungoogled-chromium
    spotify
    remmina
    chirp
    blender
    legcord
    
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