{ pkgs, ... }:
{
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;

  programs.uwsm.enable = true;

  programs.hyprland = {
    enable = true;
    withUWSM = true; # recommended for most users
    xwayland.enable = true; # Xwayland can be disabled.
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

  users.users.asorge.extraGroups = [
    "video"
    "audio"
  ];
}
