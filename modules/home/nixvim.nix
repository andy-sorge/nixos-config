{ pkgs, ... }:
{  
  programs.nixvim = {
    enable = true;
    colorschemes.gruvbox.enable = true;

    globalOpts = {
      number = true;
      # relativenumber = true;
      termguicolors = true;
    };

    plugins = {
      nvim-autopairs.enable = true;
      web-devicons.enable = true;
      lualine.enable = true;

      trouble = {
        enable = true;
      };
    
      todo-comments = {
        enable = true;
      };
    
      # nvim-ufo = {
      #   enable = true;
      # };
    
      indent-blankline = {
        enable = true;
        settings = {
          scope.enabled = true;
        };
      };

      coq-nvim = {
        enable = true;
        autoLoad = true;
        callSetup = true;
      };

      crates.enable = true;

      lsp = {
        enable = true;
        inlayHints = true;
        servers = {
          clangd = {
            enable = true;
            package = null;
          };

          rust_analyzer = {
            enable = true;
            installCargo = false;
            installRustc = false;
          };

          taplo.enable = true;
        };
      };

      conform-nvim = {
          enable = true;
          settings = {
            formatters_by_ft = {
              rust = ["rustfmt"];
              toml = ["taplo"];
            };
            format_on_save = {
              timeout_ms = 500;
              lsp_format = "fallback";
            };
          };
        };

      treesitter = {
        enable = true;
        settings = {
          highlight.enable = true;
          indent.enable = true;
        };
      };

      telescope = {
        enable = true;
        keymaps = {
          "<leader>ff" = "find_files";
          "<leader>fg" = "live_grep";
          "<leader>fb" = "buffers";
          "<leader>fh" = "help_tags";
        };
      };

      nvim-tree = {
        enable = true;
        openOnSetupFile = false;
      };

      bufferline = {
        enable = true;
        settings.options.diagnostics = "nvim_lsp";
      };

      toggleterm = {
        enable = true;
        settings = {
          open_mapping = "[[<c-\\>]]";
          direction = "float";
        };
      };

      gitsigns.enable = true;

      which-key.enable = true;
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>e";
        action = "<cmd>NvimTreeToggle<CR>";
      }
      {
        mode = "n";
        key = "<Tab>";
        action = "<cmd>BufferLineCycleNext<CR>";
      }
      {
        mode = "n";
        key = "<S-Tab>";
        action = "<cmd>BufferLineCyclePrev<CR>";
      }
      {
        mode = "n";
        key = "<leader>bd";
        action = "<cmd>bdelete<CR>";
      }
    ];
  };
}
