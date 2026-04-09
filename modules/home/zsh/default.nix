{ pkgs, ... }:
{
  imports = [
    ./starship.nix
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ll = "ls -al";
      update = "sudo nixos-rebuild switch && sudo nix-env --delete-generations +3 --profile /nix/var/nix/profiles/system && sudo nix-collect-garbage -d";
      update-reboot = "sudo nixos-rebuild boot && sudo nix-env --delete-generations +3 --profile /nix/var/nix/profiles/system && sudo nix-collect-garbage -d";
      c = "clear";
      e = "exit";
      init = "f() { mkdir -p $2 && cd $2 && nix flake init -t github:andy-sorge/nix-templates#$1 && direnv allow && git init };f";
      rr = "rm -rf";
      watch = "watch -n 0.1";
      z = "zeditor .";
      nuke = "rm -rf";
      s = "kitten ssh";
    };
    profileExtra = ''
      . "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
    '';
    history.size = 10000;
    history.ignoreAllDups = true;
    history.path = "$HOME/.zsh_history";
    history.ignorePatterns = [
      "rm *"
      "pkill *"
      "cp *"
    ];
  };
}
