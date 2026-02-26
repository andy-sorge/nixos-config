{pkgs, ...}:
{
  # default nixos sleep/hibernate manager
  powerManagement.enable = true;
  
  # configurable power manager service
  services.tlp = {
    enable = true;
  };
  
  services.thermald.enable = true;
  
  environment.systemPackages = with pkgs; [
    brightnessctl
  ];
}