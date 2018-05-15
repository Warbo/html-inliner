with rec {
  sysPkgs = import <nixpkgs> { config = {}; };
  config  = sysPkgs.fetchFromGitHub {
    owner  = "Warbo";
    repo   = "nix-config";
    rev    = "99bc878";
    sha256 = "0q8f30vzvngnnvszxxp6vhr649y4lvix4r9axhvmpc9wr5afls6s";
  };
};
with import config {};
wrap {
  name  = "html-inliner";
  file  = ./html-inliner;
  paths = [ (python.withPackages (p: [ p.beautifulsoup ])) ];
}
