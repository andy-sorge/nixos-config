{pkgs, ...}:
{
  home.packages = with pkgs; [
    # utils
    gh
    
    # editors
    zed-editor
    
    # c/c++
    gcc
    
    # nix
    nil
    nixd
  ];
}