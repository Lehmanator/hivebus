{
  inputs,
  cell,
}: let
  inherit (cell) homeProfiles homeModules;
in rec {
  default = with homeProfiles;
    [
      shellPrograms
      shellPackages
    ]
    ++ [
      inputs.cells.terminal-emulators.homeModules.zsh
      inputs.cells.base.homeProfiles.default
      inputs.cells.utils.homeProfiles.default
    ];

  desktop = with homeProfiles;
    default
    ++ [
      inputs.cells.terminal-emulators.homeProfiles.alacritty
      homeModules.alacritty
      inputs.cells.emacs.homeProfiles.default
    ];

  macbook = default ++ [];

  libvirtd = default;
}
