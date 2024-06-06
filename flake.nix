{
  outputs = { nixpkgs, ... }@inputs:
    let
      systems = [ "x86_64-linux" ];
      eachSystem = fn:
        nixpkgs.lib.genAttrs systems
        (system: fn (nixpkgs.legacyPackages.${system} // { inherit inputs; }));
    in { legacyPackages = eachSystem (pkgs: import ./packages.nix pkgs); };
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
