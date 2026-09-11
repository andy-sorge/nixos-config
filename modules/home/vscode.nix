{ pkgs, ... }:
let 
  base_extensions = with pkgs.vscode-extensions; [
    # themes
    jdinhlife.gruvbox
    teabyii.ayu
    catppuccin.catppuccin-vsc
    enkia.tokyo-night
    zhuangtongfa.material-theme

    # source control
    github.vscode-pull-request-github
    mhutchie.git-graph

    # remote
    ms-vscode-remote.vscode-remote-extensionpack
    ms-vscode.remote-explorer

    # containers
    ms-azuretools.vscode-containers
    ms-azuretools.vscode-docker

    # general use
    usernamehw.errorlens
    ms-vsliveshare.vsliveshare

    # config/aux langs
    tamasfe.even-better-toml
    jnoortheen.nix-ide
    mkhl.direnv
  ];
in
{  
  programs.vscode = {
    enable = true;
    
    profiles = {
      default = {
        extensions = base_extensions;
      };

      cpp = {
        extensions = with pkgs.vscode-extensions; [
          ms-vscode.cpptools-extension-pack
          llvm-vs-code-extensions.vscode-clangd
        ] ++ base_extensions;
      };

      python = {
        extensions = with pkgs.vscode-extensions; [
          ms-python.python
          ms-python.vscode-pylance
          ms-python.debugpy
          ms-python.vscode-python-envs
          charliermarsh.ruff
        ] ++ base_extensions;
      };

      webdev  = {
        extensions = with pkgs.vscode-extensions; [
          astro-build.astro-vscode
          dbaeumer.vscode-eslint
          yy0931.vscode-sqlite3-editor
          svelte.svelte-vscode 
        ] ++ base_extensions;
      };

      rust = {
        extensions = with pkgs.vscode-extensions; [
          rust-lang.rust-analyzer
        ] ++ base_extensions;
      };

      unity = {
        extensions = with pkgs.vscode-extensions; [
          ms-dotnettools.csdevkit
          visualstudiotoolsforunity.vstuc
        ] ++ base_extensions;
      };

      ros2 = {
        extensions = with pkgs.vscode-extensions; [
          # cpp
          ms-vscode.cpptools-extension-pack
          llvm-vs-code-extensions.vscode-clangd

          # python
          ms-python.python
          ms-python.vscode-pylance
          ms-python.debugpy
          ms-python.vscode-python-envs
          charliermarsh.ruff

          # ros2
          # ranch-hand-robotics.rde-ros-2
          # ranch-hand-robotics.urdf-editor
        ]  ++ base_extensions;
      };
    };
  };
}