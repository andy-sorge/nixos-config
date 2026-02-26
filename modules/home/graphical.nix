{pkgs, ...}:
{
  home.packages = with pkgs; [
    kitty
    google-chrome
    discord
    spotify
    
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