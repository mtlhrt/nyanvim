{ pkgs, ... }: {
  extraPlugins = with pkgs.vimPlugins; [ friendly-snippets ];
  plugins = {
    cmp = {
      enable = true;
      cmdline = let
        cmdLine = source: {
          mapping = { __raw = "cmp.mapping.preset.cmdline()"; };
          sources = [{ name = source; }];
        };
      in {
        "/" = cmdLine "buffer";
        ":" = cmdLine "path";
      };
      filetype.gitcommit.sources = [{ name = "git"; }];
      autoEnableSources = true; # autoinstall plugins for sources below
      settings.sources = [
        { name = "nvim_lsp"; }
        { name = "path"; }
        { name = "buffer"; }
        { name = "luasnip"; }
        { name = "cmd"; }
        { name = "git"; }
      ];
      settings.snippet.expand = ''
        function(args) require("luasnip").lsp_expand(args.body) end
      '';
      settings.mapping =
        let select = "{ behavior = cmp.SelectBehavior.Select }";
        in {
          "<C-space>" = "cmp.mapping.complete()";
          "<C-p>" = "cmp.mapping.select_prev_item(${select})";
          "<C-n>" = "cmp.mapping.select_next_item(${select})";
          "<cr>" = "cmp.mapping.confirm({ select = true })";
          "<C-u>" = "cmp.mapping.scroll_docs( -4)";
          "<C-d>" = "cmp.mapping.scroll_docs(4)";
        };
    };
    luasnip = {
      enable = true;
      fromVscode = [ { } ];
    };
  };
}
