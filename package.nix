{ stdenv, cmake, babble, openusd-minimal, gcc, vulkan-sdk, vulkan-loader, xorg }:
stdenv.mkDerivation {
  name = "bbl-usd";

  src = fetchGit {
    url = "/home/ashley/projects/bbl-usd-rs/bbl-usd";
    rev = "7fc5ff666ec4ac7abce1af13b5e31edefba04e3e";
  };

  nativeBuildInputs = [ cmake gcc babble ];
  buildInputs = [ openusd-minimal vulkan-sdk vulkan-loader xorg.libX11 ];

  cmakeFlags = [
    "-DVULKAN_SDK=${vulkan-sdk}"
  ];
}
