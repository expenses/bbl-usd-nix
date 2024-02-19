{ stdenv, headers, openusd-minimal, vulkan-sdk, vulkan-loader, cmake }:
stdenv.mkDerivation {
  name = "build";

  src = ./cmake;

  nativeBuildInputs = [cmake];

  buildInputs = [openusd-minimal vulkan-loader vulkan-sdk];

  cmakeFlags = [
    "-DBBL_USD_SRC_FILE=${headers}/src/openusd-c.cpp"
  ];

  installPhase = ''
    mkdir -p $out/lib
    mv libopenusd-c.a $out/lib
  '';
}
