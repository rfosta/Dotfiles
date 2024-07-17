{
  description = "My Simple Flake (Work in Progress)";

  inputs = {
    # Using stable for now, but will most likely move to unstable, and add and overlay for anytime I need to use stable.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Declaritive disk partitioning tool. Really useful when partitioning new machines.
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # A post-modern modal text editor.
    helix.url = "github:helix-editor/helix/master";

    # Apples system font
    apple-fonts.url = "github:Lyndeno/apple-fonts.nix";
    apple-fonts.inputs.nixpkgs.follows = "nixpkgs";

    # A collection of NixOS modules covering hardware quirks
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = {
    self,
    nixpkgs,
    disko,
    home-manager,
    ...
  } @ inputs: let
    system = "x86_64-linux"; # Only using one system architecture, so no need for any system functions now :p
  in {
    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        inherit system;

        specialArgs = {inherit inputs;};
        modules = [
          disko.nixosModules.disko
          ./hosts/laptop # Here we load the configuration for the system and home-manager
        ];
      };
    };
  };
}
