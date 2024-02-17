{ stdenv, cmake, babble, openusd-minimal, gcc, vulkan-sdk, vulkan-loader, xorg }:
stdenv.mkDerivation {
  name = "bbl-usd";

  src = fetchGit {
    url = "https://github.com/expenses/bbl-usd";
    rev = "856e645e87cea12db53ad6a2dd3b9ed155a2765f";
    ref = "usd-imaging+ar-resolver";
  };

  nativeBuildInputs = [ cmake gcc babble ];
  buildInputs = [ openusd-minimal vulkan-sdk vulkan-loader xorg.libX11 ];
}
