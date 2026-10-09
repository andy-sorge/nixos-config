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
    bluebubbles

    vlc
    krita
    obs-studio
    # obs-studio-plugins

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
    extraConfig = ''
      # Apple System Colors

      foreground              #ffffff
      background              #1e1e1e

      cursor                  #98989d
      cursor_text_color       #ffffff

      selection_background    #3f638b
      selection_foreground    #ffffff

      # Normal colors
      color0                  #1a1a1a
      color1                  #cc372e
      color2                  #26a439
      color3                  #cdac08
      color4                  #0869cb
      color5                  #9647bf
      color6                  #479ec2
      color7                  #98989d

      # Bright colors
      color8                  #464646
      color9                  #ff453a
      color10                 #32d74b
      color11                 #ffd60a
      color12                 #0a84ff
      color13                 #bf5af2
      color14                 #76d6ff
      color15                 #ffffff

      hide_window_decorations yes
    '';
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
