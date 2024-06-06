{ inputs, system, ... }: rec {
  withConfig = config:
    inputs.nixvim.legacyPackages.${system}.makeNixvimWithModule {
      module = import ./module // config;
      extraSpecialArgs = { inherit inputs; };
    };
  default = withConfig { };
}
