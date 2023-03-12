{
  inputs,
  cell,
}: let
  l = nixpkgs.lib // builtins;
  inherit (inputs) nixpkgs std;
  withCategory = category: attrset: attrset // {inherit category;};
in
  l.mapAttrs (_: std.lib.dev.mkShell) {
    default = {
      extraModulesPath,
      pkgs,
      ...
    }: {
      name = "Apis Mellifera";
      git.hooks = {
        enable = true;
      };
      imports = [
        cell.devshellProfiles.terraform
        std.std.devshellProfiles.default
        # inputs.cells.bootstrap.devshellProfiles.secureboot
        "${extraModulesPath}/git/hooks.nix"
      ];

      nixago = [] ++ l.attrValues cell.nixago;

      commands =
        [
          (withCategory "hexagon" {package = cell.packages.colmena;})
          (withCategory "hexagon" {package = inputs.arion.packages.arion;})
          (withCategory "secrets" {
            package =
              inputs.cells.secrets.packages.ragenix
              // {
                meta.description = "age-encrypted secrets for NixOS; drop-in replacement for agenix";
              };
          })
          (withCategory "hexagon" {package = nixpkgs.sops;})
        ]
        ++ l.optionals nixpkgs.stdenv.isLinux [
          (withCategory "hexagon" {package = inputs.nixos-generators.packages.${nixpkgs.system}.nixos-generate;})
        ];
      packages = [];
    };
  }
