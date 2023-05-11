{
  lib,
  inputs,
}: let
  inherit (inputs) haumea;
in {
  _imports = lib.attrValues (haumea.lib.load {
    src = ./__config;
    inputs = inputs;
  });
}
