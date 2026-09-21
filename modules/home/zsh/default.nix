{ pkgs, ... }:
{
  imports = [
    # ./starship.nix
  ];

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    options = [ "--cmd cd" ];
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    sessionVariables = {
      ZOXIDE_CMD_OVERRIDE = "cd";
      EDITOR = "nvim";
    };
    
    shellAliases = {
      # utils
      l = "eza -a --group-directories-first";
      ls = "eza -la --icons --no-filesize --group-directories-first";
      ll = "eza -la --icons --group-directories-first";
      ld = "eza -lD --icons --group-directories-first --no-filesize";
      lt = "eza --icons -TL 3";
      tree = "eza -T";
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
    
    history = {
      size = 10000;
      ignoreAllDups = true;
      path = "$HOME/.zsh_history";
      ignorePatterns = [
        "rm *"
        "pkill *"
        "cp *"
        "reboot"
        "exit"
        "e"
      ];
    };
    
    initContent = ''
      bindkey "^[[1;5C" forward-word
      bindkey "^[[1;5D" backward-word
      source ${./functions.zsh}
    '';

    loginExtra = ''
      make_scratch
    '';
  };
}
