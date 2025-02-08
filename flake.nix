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
      # lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        # overlays = [ nixgl.overlay ];
      };
    in
    {
      homeConfigurations = {
        home = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          modules = [
            ./home.nix
            ./packages.nix
          ];

          extraSpecialArgs = {
            homeProfile = true;
            inherit plasma-manager;
            inherit nixgl;
          };
        };
      };
    };
}
# ./plasma.nix
# ./panels.nix
# ./secrets.nix ??
# tmux, kitty + dircolors, zsh, nvim, ideavimrc, my scripts folder, xournal++ plugins
# where do i toss work aliases? I guess those don't get put here?
