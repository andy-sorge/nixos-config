{pkgs, ...}:
{
  home.packages = with pkgs; [
    fastfetch
    lf
    pistol
    ffmpeg
    imagemagick
    cmatrix
    btop
  ];
}