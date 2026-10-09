{ pkgs, config, lib, ... }:
let
  cfg = config.myDesktop;
in
{
  options.myDesktop = lib.mkOption {
    type = lib.types.enum [ "none" "plasma" "niri" "cosmic" ];
    default = "none";
    description = "Desktop environment / session to enable.";
  };

  config = lib.mkMerge [
    (lib.mkIf (cfg != "none") {
      services.xserver.xkb = {
        layout = "us";
        variant = "";
      };
    
      services.printing.enable = true;
    
      users.users.andy.extraGroups = [
        "video"
        "audio"
      ];
    })

    (lib.mkIf (cfg == "plasma") {
      services.desktopManager.plasma6.enable = true;
      services.displayManager.sddm.enable = true;
    
      environment.plasma6.excludePackages = with pkgs.kdePackages; [
        kate
        konsole
        elisa
        khelpcenter
        krunner
        okular
        discover
        qrca
      ];
    })

    (lib.mkIf (cfg == "niri") {
      programs.niri.enable = true;
      services.displayManager.sddm = { enable = true; wayland.enable = true; };
    })

    (lib.mkIf (cfg == "cosmic") {
      services.desktopManager.cosmic.enable = true;
      services.displayManager.cosmic-greeter.enable = true;
    })
  ];
}