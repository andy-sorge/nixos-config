{pkgs, ...}:
{
  # default nixos sleep/hibernate manager
  powerManagement.enable = true;
  
  # configurable power manager service
  # services.tlp = {
  #   enable = true;
  # };
  
  services = {
    gvfs.enable = true;
    upower.enable = true;
    thermald.enable = true;
    
    fprintd.enable = true;
    fprintd.tod.driver = pkgs.libfprint-2-tod1-goodix;
  };
  
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  
  environment.systemPackages = with pkgs; [
    brightnessctl
    bluez
  ];
}