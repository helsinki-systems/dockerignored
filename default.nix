{ buildGoPackage, fetchFromGitHub, writeText }:

buildGoPackage rec {
  pname = "dockerignored";
  version = "0.1";

  goPackagePath = "github.com/helsinki-systems/dockerignored";

  src = ./.;
  goDeps = src + "/deps.nix";

  postInstall = ''
    mkdir -p $out/nix-support
    cp $src/hook.sh $out/nix-support/setup-hook
  '';

  subPackages = [ "." ];
}
