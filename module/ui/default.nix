{ pkgs, ... }: {
  imports = [ ./colorscheme.nix ];
  plugins = {
    lualine = { enable = true; };
    cursorline = {
      enable = true;
      cursorline = {
        enable = true;
        timeout = 0;
      };
    };
    gitsigns.enable = true;
    nvim-colorizer = {
      enable = true;
      userDefaultOptions.names = false;
    };
  };
  extraPlugins = with pkgs.vimPlugins; [ barbecue-nvim indent-blankline-nvim ];
  extraConfigLua = ''
    require"barbecue".setup()
    require"ibl".setup {
      scope = { enabled = false }
    }
  '';
}
