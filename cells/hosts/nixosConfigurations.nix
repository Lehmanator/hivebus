{
  inputs,
  cell,
}: let
  l = inputs.nixpkgs.lib // builtins;
  inherit (cell.pops) exports;
in {
  desktop = let
    system = "x86_64-linux";
  in {
    bee.system = system;
    bee.home = inputs.home;
    bee.pkgs = import inputs.nixos-23-05 {
      inherit system;
      config.allowUnfree = true;
      config.permittedInsecurePackages = [
        "nodejs-16.20.0"
      ];
      overlays = l.flatten exports.desktop.overlays;
    };
    imports = l.flatten exports.desktop.imports;
  };

  flops = let
    system = "x86_64-linux";
  in {
    bee.system = system;
    bee.home = inputs.home;
    bee.pkgs = import inputs.nixos {
      inherit system;
      config.allowUnfree = true;
      overlays = l.flatten exports.flops.overlays;
    };
    imports = l.flatten exports.flops.imports;
  };

  tiangang = let
    system = "x86_64-linux";
  in {
    bee.system = "x86_64-linux";
    bee.home = inputs.home;
    bee.pkgs = import inputs.nixos {
      inherit (inputs.nixpkgs) system;
      overlays = l.flatten exports.tiangang.overlays;
    };
    imports = l.flatten exports.tiangang.imports;
  };

  init = let
    system = "x86_64-linux";
  in {
    bee.system = "x86_64-linux";
    bee.home = inputs.home;
    bee.pkgs = import inputs.nixos {
      inherit (inputs.nixpkgs) system;
      overlays = l.flatten exports.init.overlays;
    };
    imports = l.flatten exports.init.imports;
  };
}
