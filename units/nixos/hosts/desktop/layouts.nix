{
  inputs,
  lib,
  self,
  omnibus,
}:
let
  inherit (omnibus.lib.omnibus) mapLoadToPops mapPopsExports';
  outputs = mapPopsExports' (
    mapLoadToPops inputs.self.pops (
      n: v: {
        load.inputs = {
          inputs = (inputs.self.pops.subflake.setSystem self.system).inputs;
        };
      }
    )
  );
in
{
  inherit outputs;

  system = "x86_64-linux";

  data = outputs.local.${self.system}.data;

  hive = {
    bee.system = self.system;
    # use the mkHome function to create a home-manager profile
    # bee.home = inputs.home-manager;
    bee.pkgs = import inputs.nixos-unstable { inherit (self) system; };
    imports = lib.flatten self.nixosSuites;
  };

  nixosSuites = lib.flatten [
    outputs.hosts.nixos.nixosProfiles.default.bootstrap
    outputs.omnibus.nixosProfiles.default.presets.virtualisation.libvirtd
    outputs.omnibus.nixosProfiles.default.presets.virtualisation.podman

    # # # --custom profiles
    # outputs.pops.nixosProfiles.layouts.customProfiles.presets.nix
    # outputs.pops.nixosProfiles.layouts.customProfiles.presets.boot
    # outputs.pops.nixosModules.layouts.customModules.boot

    # outputs.srvos.default.common.nix
    (outputs.omnibus.self.default.mkHome inputs.home.nixosModule
      {
        guangtao = {
          uid = 1000;
          description = "default manager";
          isNormalUser = true;
          extraGroups = [ "wheel" ];
        };
      }
      "zsh"
      self.homeSuites
    )
  ];

  homeSuites = [
    outputs.homeProfiles.default.apps.doomemacs-desktop
    outputs.omnibus.homeProfiles.default.shell.full
    # outputs.homeProfiles.presets.bat
    # # # The parent directory of "presets" is categorized as a list type of "suites"
    # (outputs.homeProfiles.shell { }).default
  ];
}
