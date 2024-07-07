{ buildNpmPackage, importNpmLock }:
buildNpmPackage {
  pname = "SillyTavern";
  version = "tag";
  src = ./.;
  # makeCacheWritable = true;
  # npmFlags = [
  #   "--legacy-peer-deps"
  #   "--ignore-scripts"
  #   "--omit=dev"
  # ];
  npmDeps = importNpmLock { npmRoot = ./.; };
  npmConfigHook = importNpmLock.npmConfigHook;
  buildPhase = "true";
  installPhase = ''
    mkdir -p $out
    mv * $out
  '';
}
