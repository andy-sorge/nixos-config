{ pkgs, ... }:
{
  programs.nixvim = {
    enable = true;

    colorschemes.gruvbox.enable = true;
    plugins.lualine.enable = true;
    plugins.coq-nvim = {
      enable = true;
      autoLoad = true;
    };
    
    plugins.lsp = {
      enable = true;
      servers = {
        clangd = {
          enable = true;
          package = null;
        };
      };
    };
    
    plugins.comfy-line-numbers = {
      enable = true;
    };
  };
}
