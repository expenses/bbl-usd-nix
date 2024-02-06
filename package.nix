{ stdenv, cmake, babble, openusd-minimal, tbb }:
stdenv.mkDerivation {
  name = "bbl-usd";

  src = fetchGit {
    url = "https://github.com/expenses/bbl-usd";
    rev = "8229fd0296e6a1d4eb66b7c2aecbf7e257c9a370";
    ref = "usd-imaging+ar-resolver";
  };

  # Distinguishing between native build inputs (runnable on the host
  # at compile time) and normal build inputs (runnable on target
  # platform at run time) is important for cross compilation.
  nativeBuildInputs = [ cmake babble openusd-minimal tbb ];
  buildInputs = [ ];

}
