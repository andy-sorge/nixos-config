{pkgs, ...}:
{
  home.packages = with pkgs; [
    kitty
    google-chrome
    discord
    spotify
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