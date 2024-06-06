{ inputs, system, ... }: rec {
  withConfig = config:
    let
      inherit (inputs) nixpkgs nixvim;
      nixvim' = nixvim.legacyPackages.${system};
      pkgs = import nixpkgs { inherit system; };
      nyanvim = nixvim'.makeNixvimWithModule {
        inherit pkgs;
        module = import ./module;
        extraSpecialArgs = { inherit inputs; };
      };
    in nyanvim.nixvimExtend config;

  default = withConfig { };
}
