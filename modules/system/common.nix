{ pkgs, ... }:
{
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader.systemd-boot = {
    enable = true;
    configurationLimit = 3;
  };
  boot.loader.efi.canTouchEfiVariables = true;
  
  nix.gc = {
    automatic = true;
    dates = "daily";
  };
  
  users.users.andy = {
    isNormalUser = true;
    description = "Andy Sorge";
    extraGroups = [
      "networkmanager"
      "input"
      "wheel"
      "wireshark"
    ];
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nix.settings.trusted-users = [
    "root"
    "andy"
  ];

  # networking.wireless.iwd = {
  #   enable = true;
  #   settings = {
  #     General.EnableNetworkConfiguration = true;
  #     General.AddressRandomization = "network";
  #     Network.EnableIPv6 = true;
  #     Settings.AutoConnect = true;
  #   };
  # };
  
  services.resolved.enable = true;
  
  networking.networkmanager = {
    enable = true;
    # wifi.backend = "iwd";
  };

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
    # neovim
    ripgrep
    wget
    git
    git-lfs
    net-tools
    zip
    unzip
    libarchive
    file
    usbutils
    tree
  ];

  programs.zsh.enable = true;
  users.users.andy = {
    shell = pkgs.zsh;
  };

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      stdenv.cc.cc
      zlib
      openssl
    ];
  };
  
  programs.wireshark.enable = true;

  nix.settings = {
    extra-substituters = [
      "https://vicinae.cachix.org"
    ];

    extra-trusted-public-keys = [
      "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc="
    ];
  };
}
