{pkgs, inputs, ...}:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in {
  home.packages = with pkgs; [
    ungoogled-chromium
    remmina
    blender
    legcord
    signal-desktop
    libreoffice
    zoom-us
    slack
    obsidian
    
    vlc
    krita
    
    kdePackages.gwenview
    
    meshlab
    orca-slicer
    
    nerd-fonts.jetbrains-mono
  ];

  programs.kitty = {
    enable = true;
    shellIntegration.enableFishIntegration = true;
    settings = {
      shell = "fish";
    };
    themeFile = "gruvbox-dark";
  };
  
  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.onepunch;
  };
  
  programs.vicinae = {
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