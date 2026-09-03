{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -g fish_greeting
      # fastfetch
    '';

    plugins = [
      { name = "grc"; src = pkgs.fishPlugins.grc.src; }
      { name = "tide"; src = pkgs.fishPlugins.tide.src; }
    ];

    shellAliases = {
      # utils
      l = "eza -a --group-directories-first";
      ls = "eza -la --icons --no-filesize --group-directories-first";
      ll = "eza -la --icons --group-directories-first";
      ld = "eza -lD --icons --group-directories-first --no-filesize";
      lt = "eza --icons -TL 3";
      tree = "eza -T";
      cat = "bat --decorations never";
      grep = "grep --color=auto";
      c = "clear";
      e = "exit";
      rr = "rm -rf";
      watch = "watch -n 0.1";
      nuke = "sudo rm -rf";
      s = "kitten ssh";
      
      # nix specific
      config = "zeditor ~/nixos-config";
      ns = "nix-shell -p";

      # scratch
      scratch = "cd ~/.scratch";
      sc = "scratch";
    };
    
  };

  home.packages = with pkgs; [
    grc
  ];
}