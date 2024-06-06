{
  imports = [ ./browser.nix ];
  keymaps = let
    helpers = import ../../helpers.nix;
    telescope = fn: ''require("telescope.builtin").${fn}'';
    inherit (helpers) mkNLua;
  in [
    (mkNLua "<leader>ff" (telescope "find_files"))
    (mkNLua "<leader>fg" (telescope "live_grep"))
    (mkNLua "<leader>fb" (telescope "buffers"))
    (mkNLua "<leader>fd" (telescope "diagnostics"))
    (mkNLua "<leader>fq" (telescope "quickfix"))
    (mkNLua "<leader>fo" (telescope "vim_options"))
    (mkNLua "<leader>fc" (telescope "command_history"))
    (mkNLua "<leader>fm" (telescope "marks"))
    (mkNLua "<leader>fr" (telescope "lsp_references"))
    (mkNLua "<leader>fi" (telescope "lsp_implementations"))
    (mkNLua "<leader>o" (telescope "oldfiles"))
  ];
}
