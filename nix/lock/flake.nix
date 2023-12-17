{
  inputs = {
    nixos-generators.url = "github:nix-community/nixos-generators";
    nixos-hardware.url = "github:nixos/nixos-hardware";
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    disko-legcy.url = "github:nix-community/disko/29d632d7e8fa86f937153ecdfd7d768411001d2d";
    disko-legcy.inputs.nixpkgs.follows = "nixpkgs";

    srvos.url = "github:numtide/srvos";
    srvos.inputs.nixpkgs.follows = "nixpkgs";

    nixpkgs-hardenedlinux.url = "github:hardenedlinux/nixpkgs-hardenedlinux";
    nixpkgs-hardenedlinux.inputs.nixpkgs.follows = "nixpkgs";
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixpkgs-master.url = "github:nixos/nixpkgs";

    darwin.url = "github:LnL7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    nixos.follows = "nixos-unstable";

    darwin-nixos-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    nixos-23-11.url = "github:nixos/nixpkgs/release-23.11";

    home-23-11.url = "github:nix-community/home-manager/release-23.11";
    home-23-11.inputs.nixpkgs.follows = "nixos-23-11";

    home.url = "github:nix-community/home-manager";
    home.inputs.nixpkgs.follows = "nixos";

    ragenix.url = "github:yaxitech/ragenix";

    ragenix.inputs.nixpkgs.follows = "nixpkgs";
    ragenix.inputs.agenix.follows = "agenix";
    agenix.url = "github:ryantm/agenix";

    impermanence.url = "github:nix-community/impermanence";
    attic.url = "github:zhaofengli/attic";
  };

  inputs = {
    emacs-overlay.url = "github:nix-community/emacs-overlay";
    emacs-overlay.inputs.nixpkgs.follows = "nixpkgs";

    nil.url = "github:oxalica/nil";

    nix-filter = {
      url = "github:numtide/nix-filter";
    };
    catppuccin-bat = {
      url = "github:catppuccin/bat";
      flake = false;
    };
  };
  outputs = _: { };
}
