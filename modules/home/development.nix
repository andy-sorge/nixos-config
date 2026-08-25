{ pkgs, ... }:
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
  
    signing = {
      key = "/home/andy/.ssh/id_ed25519_sk_rk.pub";
      signByDefault = true;
    };
  
    settings = {
      user = {
        name = "Andy Sorge";
        email = "124544413+andy-sorge@users.noreply.github.com";
      };
      
      gpg.format = "ssh";
      init.defaultBranch = "main";
  
      filter.lfs = {
        clean = "git-lfs clean -- %f";
        smudge = "git-lfs smudge -- %f";
        process = "git-lfs filter-process";
        required = true;
      };
  
      credential."https://github.com".helper = [
        ""
        "!/etc/profiles/per-user/andy/bin/gh auth git-credential"
      ];
      credential."https://gist.github.com".helper = [
        ""
        "!/etc/profiles/per-user/andy/bin/gh auth git-credential"
      ];
    };
  };
}
