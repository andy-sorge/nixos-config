{ pkgs, osConfig, ... }:
{
  home.packages = with pkgs; [
    # utils
    gh

    # editors
    zed-editor

    # nix
    nil
    nixd
    nixfmt
  ];

  programs.git = {
    enable = true;
    lfs.enable = true;
  
    signing = {
      key = "/home/andy/.ssh/${osConfig.networking.hostName}.pub";
      signByDefault = true;
    };
  
    settings = {
      user = {
        name = "Andy Sorge";
        email = "124544413+andy-sorge@users.noreply.github.com";
      };
      
      gpg.format = "ssh";
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
  
      # filter.lfs = {
      #    clean = "git-lfs clean -- %f";
      #   smudge = "git-lfs smudge -- %f";
      #   process = "git-lfs filter-process";
      #   required = true;
      # };
    };
  };
}
