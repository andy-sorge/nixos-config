{pkgs, ...}:
{
  home.packages = with pkgs; [
    # utils
    gh
    
    # editors
    zed-editor
    
    # c/c++
    gcc
    cmake
    gdb
    
    # nix
    nil
    nixd
    
    # rust
    cargo
    rustc
  ];
}