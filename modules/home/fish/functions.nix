{}:
{
  programs.fish.functions = {
    flake_init = ''
      if test -z "$argv[1]"
          set PROJECT_TYPE (
              nix flake show github:nixos/templates --json |\
              jq -r '.templates | keys[]' |\
              gum filter \
                  --placeholder="project type..."
          )
          if test $status -ne 0; or test -z "$PROJECT_TYPE"
              return 1
          end
      else
          set PROJECT_TYPE $argv[1]
      end
  
      nix flake show github:nixos/templates --json |\
          jq -r '.templates | keys[]' |\
          grep $PROJECT_TYPE >/dev/null 
      or begin
          echo invalid project type
          return 1
      end
  
      if test -z "$argv[2]"
          set PROJECT_NAME (gum input --placeholder="project name...")
          if test $status -ne 0; or test -z "$PROJECT_NAME"
              return 1
          end
      else
          set PROJECT_NAME $argv[2]
      end
  
      mkdir -p ~/code/$PROJECT_NAME
      cd ~/code/$PROJECT_NAME
      gum spin --title="initializing template..." -- nix flake init -t github:nixos/templates#$PROJECT_TYPE
      git init
      echo "use flake" >> .envrc
      git add .
      direnv allow
    '';

    update = ''
      echo "would you also like to update packages?"
      set UPDATE_PKGS (gum choose "no" "yes")
  
      echo "would you like to apply changes now or on reboot?"
      set WHEN (gum choose "now" "reboot")
  
      echo "garbage collect?"
      set GC (gum choose "yes" "no")
  
      if test "$UPDATE_PKGS" = "yes"
          gum spin --title="updating packages..." -- nix flake update
      end
  
      if test "$WHEN" = "now"
          sudo gum spin --title="building..." -- sudo nixos-rebuild switch
      else
          sudo gum spin --title="building..." -- sudo nixos-rebuild reboot
      end
  
      if test "$GC" = "yes"
          sudo gum spin --title="deleting old profiles..." -- sudo nix-env --delete-generations +3 --profile /nix/var/nix/profiles/system
          sudo gum spin --title="collecting garbage..." -- sudo nix-collect-garbage
      end
    '';

    make_scratch = ''
      if test ! -d "$HOME/.scratch"
          mkdir "$TMPDIR/.scratch"
          ln -s "$TMPDIR/.scratch" "$HOME/.scratch"
      end
      cd "$HOME/.scratch"
    '';

    cleartemp = ''
      set tmp_dir (realpath "$TMPDIR/.scratch")
      set started_inside false
      
      if string match -q "$tmp_dir*" (realpath "$PWD")
          cd ~
          set started_inside true
      end
  
      gum confirm --selected.background="2" --selected.foreground="7" \
          "completely clean the ~/.scratch directory?" \
          && rm -rf ~/.scratch
          && rm -rf $TMPDIR/.scratch
  
      make_scratch
  
      if test "$started_inside" = "true"
          cd ~/.scratch
      end
    '';
  };
}