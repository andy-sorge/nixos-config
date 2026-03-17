{ pkgs, ... }:
{
  imports = [
    ./zsh
  ];
  
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
