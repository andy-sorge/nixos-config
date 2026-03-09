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
}
