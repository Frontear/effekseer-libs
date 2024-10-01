{
  buildFHSUserEnv,
}:
(buildFHSUserEnv {
  name = "effekseer-fhs";
  runScript = ./bin/builder.sh;

  targetPkgs = pkgs: with pkgs; [
    git

    bintools-unwrapped # gcc does not have /bin/ar
    gcc

    ant
    cmake
    openjdk
    python3
    swig

    libGL.dev
    openal
  ];
}).env
