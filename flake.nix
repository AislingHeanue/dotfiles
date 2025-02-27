{
  description = "My Home Manager Flake for Arch Linux with KDE";

  inputs = {
    nixpkgs = {
      url = "nixpkgs/nixos-24.11";
    };

    nixgl = {
      url = "github:nix-community/nixGL";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      url = "github:pjones/plasma-manager";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
  };

  # Intended to be used on Arch. Packages that are not covered by this file.
  # All 'system' packages including anything in `make arch-packages`
  # steam (which requires a large pile of multilib dependencies on arch and therefore should not be installed at user level).
  # All the KDE apps because are better to use with the version tied to my current KDE: `make kde-packages`

  outputs =
    {
      nixpkgs,
      nixgl,
      home-manager,
      plasma-manager,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      username = "aisling";
      homeDirectory = "/home/aisling";
    in
    {
      homeConfigurations = {
        personal = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          modules = [
            ./home.nix
            ./packages.nix
            ./file.nix
            # ./plasma.nix
          ];

          extraSpecialArgs = {
            personalProfile = true;
            dotfilesDir = "${homeDirectory}/Documents/Coding/github/dotfiles";
            inherit nixgl;
            inherit plasma-manager;
            inherit username;
            inherit homeDirectory;
          };
        };
      };
    };
}
# ./plasma.nix
# ./panels.nix
# ./aliases.nix
# github config (dummy)
# make a better tmux setup
# whatever else is in my omz folder because that's pretty important
