{
  description = "C++ Crosscompilation Example";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    babble = { url = "github:expenses/babble-nix"; };

    openusd-minimal = { url = "github:expenses/openusd-minimal-nix/vulkan-support"; };
  };

  outputs = inputs@{ flake-parts, babble, openusd-minimal, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems =
        [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin" ];
      perSystem = { config, pkgs, system, ... }: {
        packages = {
          default = pkgs.callPackage ./package.nix {
            babble = babble.packages.${system}.default;
            openusd-minimal = openusd-minimal.packages.${system}.default.override {vulkanSupport = true;};
            vulkan-sdk = openusd-minimal.packages.${system}.vulkan-sdk;
          };
        };
      };
      flake = { };
    };
}
