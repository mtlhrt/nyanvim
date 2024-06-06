{
  plugins.fugitive.enable = true;
  keymaps = let helpers = import ../../helpers.nix;
  in [ (helpers.mkNLua "<leader>gs" "vim.cmd.Git") ];
}
