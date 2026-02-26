{pkgs, ...}:
{
  users.users.asorge = {
    isNormalUser = true;
    description = "Andy Sorge";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };
  
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nix.settings.trusted-users = [
    "root"
    "asorge"
  ];
  
  networking.networkmanager.enable = true;

  time.timeZone = "America/Los_Angeles";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
  
  services.tailscale = {
    enable = true;
  };
  
  nixpkgs.config.allowUnfree = true;
  
  environment.systemPackages = with pkgs; [
    neovim
    wget
    git
    net-tools
    unzip
    file
  ];
  
  nix.settings = {
    extra-substituters = [
      "https://vicinae.cachix.org"
    ];
    
    extra-trusted-public-keys = [
      "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc="
    ];
  };
}