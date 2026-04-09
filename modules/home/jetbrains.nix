{ pkgs, ... }:
{
  home.packages = with pkgs.jetbrains; [
    clion
    webstorm
    rider
    rust-rover
    pycharm
  ];
}