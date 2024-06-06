let inherit (import ./helpers.nix) mkN mkV;
in {
  keymaps = let
    normalMaps = [
      (mkN "<C-d>" "<C-d>zz")
      (mkN "<C-u>" "<C-u>zz")
      (mkN "G" "Gzz")
      (mkN "<leader>y" ''"+y'')
      (mkN "<leader>Y" ''"+Y'')
      {
        mode = "n";
        key = "<leader>ft";
        action.__raw = "function() vim.lsp.buf.format() end";
        options = {
          noremap = true;
          desc = "Format buffer";
        };
      }
    ];
    viselectMaps = [
      (mkV "<leader>y" ''"+y'')
      {
        mode = "v";
        key = "<leader>po";
        action = ''"_dP'';
        options = {
          noremap = true;
          desc = "Paste over ";
        };
      }
    ];
  in normalMaps ++ viselectMaps;
}
