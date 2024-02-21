{
  description = "C++ Crosscompilation Example";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    babble.url = "github:expenses/babble-nix";
    openusd-minimal.url = "github:expenses/openusd-minimal-nix/windows-tbb";
  };

  outputs = inputs @ { flake-parts, babble, openusd-minimal, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems =
        [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin" ];
      perSystem = { config, pkgs, system, ... }:
      let
        openusd = openusd-minimal.packages.${system}.default.override {vulkanSupport = true; static = true;};
        openusd-win = openusd-minimal.packages.${system}.windows.override {vulkanSupport = true;};
      in
      {
        packages = rec {
          default = pkgs.callPackage ./package.nix {
            babble = babble.packages.${system}.default;
            openusd-minimal = openusd;
            vulkan-sdk = openusd-minimal.packages.${system}.vulkan-sdk;
          };
          windows = pkgs.pkgsCross.mingwW64.callPackage ./build.nix {
            headers = default;
            openusd-minimal = openusd-win;
            vulkan-sdk = openusd-minimal.packages.${system}.vulkan-sdk;
          };
          inherit openusd openusd-win;
        };
      };
      flake = { };
    };
}
