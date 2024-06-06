{ pkgs, ... }: {
  imports = [ ./cmp ./telescope ./fugitive ./markdown-preview ];

  plugins = {
    nix.enable = true;
    leap.enable = true;
    surround.enable = true;
    markdown-preview.enable = true;
    comment.enable = true;
    nvim-autopairs = {
      enable = true;
      settings.disabled_filetypes = [ "clj" ];
    };
    ts-autotag.enable = true;
  };
  extraPlugins = with pkgs.vimPlugins; [
    vim-rhubarb
    vim-sexp
    vim-sexp-mappings-for-regular-people
    (pkgs.vimUtils.buildVimPlugin rec {
      name = "vim-just";
      src = pkgs.fetchFromGitHub {
        owner = "noahtheduke";
        repo = name;
        rev = "974b16e257e2d30d94ec954d815ff2755fa229fb";
        sha256 = "sha256-7Np2XatOQMyxtRqfwNa6YOtgjG1NwpmSYNidy15LFlg=";
      };
    })
  ];
}
