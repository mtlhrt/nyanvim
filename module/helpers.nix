rec {
  mkMap = mode: key: action: { inherit mode key action; };
  mkN = mkMap "n";
  mkV = mkMap "v";
  mkS = mkMap "s";
  mkNLua = key: action: (mkN key { __raw = action; });
}
