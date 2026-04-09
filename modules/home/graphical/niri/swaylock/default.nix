{ pkgs, ... }:
{
  xdg.configFile."swaylock/config".text = ''
    inside-color=0000002a
    inside-clear-color=0000002a
    inside-caps-lock-color=0000002a
    inside-ver-color=0000002a
    inside-wrong-color=0000002a
    
    key-hl-color=ffffff
    bs-hl-color=ffbaba
    caps-lock-bs-hl-color=0000002a
    caps-lock-key-hl-color=ffffb8
    
    line-color=00000000
    line-clear-color=00000000
    line-caps-lock-color=00000000
    line-ver-color=00000000
    line-wrong-color=00000000# Source - https://stackoverflow.com/a/24016147
    # Posted by pacholik
    # Retrieved 2026-03-20, License - CC BY-SA 3.0
    
    read -rsn1

    
    ring-color=ffffff2a
    ring-clear-color=ffffb8
    ring-caps-lock-color=ffffb82a
    ring-ver-color=ffffff2a
    ring-wrong-color=ffbaba
    separator-color=00000000
    
    text-color=ffffff
    text-clear-color=ffffb800
    text-caps-lock-color=ffffff6a
    text-ver-color=00000000
    text-wrong-color=ffbaba00
  '';
  
  programs.swaylock = {
    enable = true;
    settings = {
      image="~/wallpapers/0_gruv.jpg";
    };
  };
}