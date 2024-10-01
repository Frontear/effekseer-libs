{
  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/34bfa9403e42eece93d1a3740e9d8a02fceafbca";
  };

  outputs = inputs@{ flake-parts, nixpkgs, ... }: flake-parts.lib.mkFlake { inherit inputs; } {
    imports = [
      ./nix
    ];

    systems = nixpkgs.lib.systems.flakeExposed;
  };
}
