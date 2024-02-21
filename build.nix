{ stdenv, headers, openusd-minimal, vulkan-sdk, vulkan-loader, cmake }:
stdenv.mkDerivation {
  name = "build";

  src = ./cmake;

  nativeBuildInputs = [cmake];

  buildInputs = [openusd-minimal vulkan-loader vulkan-sdk];

  cmakeFlags = [
    "-DBBL_USD_SRC_DIR=${headers}/src"
  ];

  installPhase = ''
    mkdir -p $out/lib
    mkdir -p $out/bin
    mv *.a $out/lib
    mv *.exe $out/bin
  '';
}
