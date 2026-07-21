{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # utils
    gh

    # editors
    zed-editor
    vscode

    # nix
    nil
    nixd
    nixfmt
  ];
}
