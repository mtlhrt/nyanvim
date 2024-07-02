# nyanvim
my [Neovim](https://neovim.io/) configuration, built with [Nixvim](https://github.com/nix-community/nixvim).
might or not soon be deprecated in favour of [`mtlhrt/patchy`](https://github.com/mtlhrt/patchy).

## usage
add this repository as an input to your flake:
```nix
{
    inputs.nyanvim.url = "github:mtlhrt/nyanvim";
}
```

and then grab a derivation by calling `withConfig` with a set of options normally passed to `programs.nixvim`,
so for [Home Manager](https://github.com/nix-community/home-manager) you can do:
```nix
{ inputs, system, ... }: {
    home.packages = 
    let
        nyanvim = inputs.nyanvim.legacyPackages.{system};
    in
    [
        (nyanvim.withConfig {
            opts.nu = true;
            globals.mapLeader = " ";
            # ...and other `programs.nixvim` options. does override and may be an empty set.
         })
    ];
}
```

et voilá.
