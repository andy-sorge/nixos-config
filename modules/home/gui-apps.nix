{pkgs, inputs, ...}:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in {
  home.packages = with pkgs; [
    kitty
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
  
  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.onepunch;
  };
  
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