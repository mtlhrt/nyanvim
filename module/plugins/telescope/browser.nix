{
  plugins.telescope = {
    enable = true;
    extensions = {
      file-browser = {
        enable = true;
        settings = {
          hijack_netrw = true;
          respect_gitignore = false;
        };
      };
      fzf-native.enable = true;
    };
  };
  globals = {
    loaded_netrw = 1;
    loaded_netrwPlugin = 1;
  };
  keymaps = let
    luaFn = body: "function() ${body} end";
    showBrowser = ''
      require("telescope").extensions.file_browser.file_browser({ path = "%:p:h"})'';
  in [
    {
      mode = "n";
      key = "<leader>pp";
      action.__raw = luaFn showBrowser;
      options = {
        silent = true;
        noremap = true;
        desc = "Show file browser";
      };
    }
    {
      mode = "n";
      key = "<leader>pv";
      action.__raw = luaFn ''
        vim.cmd("vsplit")
        ${showBrowser}
      '';
      options = {
        silent = true;
        noremap = true;
        desc = "Show file browser and vsplit";
      };
    }
    {
      mode = "n";
      key = "<leader>px";
      action.__raw = luaFn ''
        vim.cmd("split")
        ${showBrowser}
      '';
      options = {
        silent = true;
        noremap = true;
        desc = "Show file browser and hsplit";
      };
    }
  ];
}
