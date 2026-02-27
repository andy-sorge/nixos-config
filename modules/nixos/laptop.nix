{pkgs, ...}:
{
  # default nixos sleep/hibernate manager
  powerManagement.enable = true;
  
  # configurable power manager service
  services.tlp = {
    enable = true;
  };
  
  services = {
    gvfs.enable = true;
    upower.enable = true;
    thermald.enable = true;
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