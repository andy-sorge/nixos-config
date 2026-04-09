{ pkgs, ... }:
{
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  
  programs.niri.enable = true;
  xdg.portal.config.niri = {
    "org.freedesktop.impl.portal.FileChooser" = [ "kde" ];
  };

  # programs.hyprland = {
  #   enable = true;
  #   xwayland.enable = true;
  # };

  # services.desktopManager.plasma6.enable = true;
  # environment.plasma6.excludePackages = with pkgs.kdePackages; [
  #   kate
  #   konsole
  #   elisa
  #   khelpcenter
  #   krunner
  # ];
  
  environment.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "qt6ct";
    QT_QPA_PLATFORMTHEME_QT6 = "qt6ct";
  };
  
  environment.systemPackages = with pkgs; [
    # kdePackages.print-manager
    system-config-printer
  ];
  
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = ''
          ${pkgs.greetd.tuigreet}/bin/tuigreet \
            --time \
            --remember \
            --remember-session \
            --greeting "Property of Andy Sorge" \
            --asterisks \
            --theme border=red;text=white;prompt=green;time=red;action=gray;button=gray;container=black;input=green
            --sessions /run/current-system/sw/share/wayland-sessions
        '';
        user = "greeter";
      };
    };
  };

  # Enable sound with pipewire
  services.pulseaudio.enable = false; # Disable PulseAudio
  security.rtkit.enable = true; # Required for PipeWire
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # wireplumber.enable = true; # WirePlumber is default now
  };
  
  services.printing.enable = true;
  
  security.pam.services.login.kwallet.enable = true;

  users.users.andy.extraGroups = [
    "video"
    "audio"
  ];
}
