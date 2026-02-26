{pkgs, ...}:
{
  home.packages = with pkgs; [
    # cli
    binutils
    exiftool
    binwalk
    foremost
    
    #gui
    wireshark
  ];
}