{
  buildNpmPackage,
  importNpmLock,
  nodejs,
}:
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
    mkdir -p $out/{bin,lib}
    mv * $out/lib
    cat > $out/bin/SillyTavern <<- EOF
    #!/usr/bin/env bash

    ${nodejs}/bin/node $out/lib/server.js \$@
    EOF
    chmod +x $out/bin/SillyTavern
  '';
}
