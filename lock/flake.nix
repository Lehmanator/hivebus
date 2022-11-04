{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/14ccaaedd95a488dd7ae142757884d8e125b3363";
  };

  inputs = {
    emacs-overlay.url = "github:nix-community/emacs-overlay";
    emacs-overlay.inputs.nixpkgs.follows = "nixpkgs";
  };

  inputs = {
    # https://github.com/DeterminateSystems/bootspec
    bootsec.url = "github:DeterminateSystems/bootspec";
    bootsec.inputs.nixpkgs.follows = "nixpkgs";
  };

  inputs = {
    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";

    ragenix.url = "github:yaxitech/ragenix";
    ragenix.inputs.nixpkgs.follows = "nixpkgs";

    vault-secrets.url = "github:gtrunsec/vault-secrets";
    vault-secrets.inputs.nixpkgs.follows = "nixpkgs";
  };

  inputs = {
    styx.url = "github:styx-static/styx";
    styx.inputs.nixpkgs.follows = "nixpkgs";
  };

  # Orchestration
  inputs = {
    nomad-driver.url = "github:input-output-hk/nomad-driver-nix";
    nomad-driver.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {self, ...}: {};
}
