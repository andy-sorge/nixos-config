{ pkgs, lib, ... }:
{
  imports = [
    ./niri.nix
  ];
  
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  programs.niri.enable = true;
  
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = lib.mkForce [ pkgs.xdg-desktop-portal-gtk ];
    configPackages = [ pkgs.xdg-desktop-portal-gtk ];
    
    # config.niri = {
    #   "org.freedesktop.impl.portal.Access" = lib.mkForce "kde";
    #   "org.freedesktop.impl.portal.FileChooser" = "kde";
    #   "org.freedesktop.impl.portal.Secret" = lib.mkForce "kwallet6";
    # };
  };

  # services.desktopManager.plasma6.enable = true;
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    kate
    konsole
    elisa
    khelpcenter
    krunner
    kwallet
    kwallet-pam
    kwalletmanager
  ];

  environment.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "qt6ct";
    QT_QPA_PLATFORMTHEME_QT6 = "qt6ct";
  };

  environment.systemPackages = with pkgs; [
    # kdePackages.print-manager
    # system-config-printer
    # kdePackages.kwallet
    # kdePackages.kwallet-pam
    # kdePackages.kwalletmanager
  ];

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --remember-session --greeting 'Property of Andy Sorge' --asterisks --theme 'border=red;text=red;prompt=red;time=redbbb ;action=red;button=red;container=black;input=red' --sessions /run/current-system/sw/share/wayland-sessions";
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
  
  security.pam.services = {
    greetd = {
      # kwallet = {
      #   enable = true;
      #   package = pkgs.kdePackages.kwallet-pam;
      #   forceRun = true;
      # };
      # enableGnomeKeyring = true;
      fprintAuth = false;
    };
    
    login = {
      # kwallet = {
      #   enable = true;
      #   package = pkgs.kdePackages.kwallet-pam;
      # };
      # enableGnomeKeyring = true;
    };
    
    swaylock = {
      # kwallet = {
      #   enable = true;
      #   package = pkgs.kdePackages.kwallet-pam;
      # };
      # enableGnomeKeyring = true;
    };
    
    # gnome.enableGnomeKeyring = true;
  };
  
  services.gnome.gnome-keyring.enable = true;
  services.gnome.gcr-ssh-agent.enable = false;
  
  # systemd.user.services.kwalletd = {
  #   enable = true;
  #   description = "KWallet Daemon";
  #   partOf = [ "graphical-session.target" ];
  #   after = [ "graphical-session.target" ];
  #   environment = {
  #     QT_QPA_PLATFORM = "wayland";
  #   };
  #   serviceConfig = {
  #     ExecStart = "${pkgs.kdePackages.kwallet}/bin/kwalletd6 --pam-login";
  #   };
  #   wantedBy = [ "graphical-session.target" ];
  # };

  # security.pam.services = {
  #   login.fprintAuth = false;
  #   greetd.fprintAuth = false;
  # };

  users.users.andy.extraGroups = [
    "video"
    "audio"
  ];
}
