{ pkgs, ... }: {
  globals.ftplugin_sql_omni_key = "<C-j>";
  plugins = {
    treesitter = {
      enable = true;
      nixGrammars = true;
      ensureInstalled = "all";
      nixvimInjections = true;
    };
    lsp = {
      enable = true;
      servers = {
        # [1] Should be sourced from a devshell.
        nil_ls.enable = true; # Nix.
        lua-ls.enable = true;
        hls.enable = true; # Haskell.
        tsserver.enable = true;
        html.enable = true;
        bashls.enable = true;
        clangd.enable = true;
        jsonls.enable = true;
        cssls.enable = true;
        taplo.enable = true; # TOML.
        clojure-lsp.enable = true;
        gleam = {
          enable = true;
          package = null; # [1]
        };
        rust-analyzer = {
          enable = true;
          # [1]
          installCargo = false;
          installRustc = false;
          package = null;
        };
      };
      onAttach = ''
        bufopts = { noremap = true, silent = true, buffer = bufnr }

        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
        vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<cr>", bufopts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, bufops)
        vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<cr>")
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
        vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, bufopts)
      '';
    };
    none-ls = {
      enable = true;
      sources.formatting = {
        nixfmt.enable = true;
        shfmt.enable = true;
        prettier = {
          enable = true;
          disableTsServerFormatter = true;
        };
        prettierd.enable = true;
      };
    };
    lspsaga = {
      enable = true;
      extraOptions.lightbulb.enable = false;
    };
    fidget.enable = true;
  };
  extraPlugins = [
    pkgs.vimPlugins.lsp-inlayhints-nvim
    (pkgs.vimUtils.buildVimPlugin {
      pname = "toggle-lsp-diagnostics-nvim";
      version = "master";
      src = pkgs.fetchFromGitHub {
        owner = "WhoIsSethDaniel";
        repo = "toggle-lsp-diagnostics.nvim";
        rev = "a896a95851fe5c5adf71a50030d60f8fa488fa7e";
        sha256 = "sha256-coedGERDTVmAD3+/QaEaq4peK7cCaOPo5ooKEalqasI=";
      };
    })
  ];
  extraConfigLua = ''
    require"lsp-inlayhints".setup {
      inlay_hints = {
        parameter_hints = {
          prefix = "f"
        }
      }
    }
    vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
    vim.api.nvim_create_autocmd("LspAttach", {
      group = "LspAttach_inlayhints",
      callback = function(args)
        if not (args.data and args.data.client_id) then
          return
        end

        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        require("lsp-inlayhints").on_attach(client, bufnr)
      end,
    })

    require"toggle_lsp_diagnostics".init()
  '';
}
