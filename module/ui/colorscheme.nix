{ pkgs, ... }: {
  extraPlugins = let
    twilight-moon = let rev = "4f6521a043d15f0b402f8a25fbfb166715b058ab";
    in (pkgs.vimUtils.buildVimPlugin {
      pname = "twilight-moon";
      version = builtins.substring 0 6 rev;
      src = pkgs.fetchFromGitHub {
        inherit rev;
        owner = "comfysage";
        repo = "twilight-moon";
        hash = "sha256-caHzyUPlUrwJVanwONTOiJokANRTXvvA0sT/Ig5Yjss=";
      };
    });
  in [ twilight-moon ];

  extraConfigLua = ''
    local twilight_moon = require "twilight-moon"

    twilight_moon.setup {
      transparent_background = true,
    }
    twilight_moon.load {}
  '';
}
