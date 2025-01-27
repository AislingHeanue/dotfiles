{
  description = "My Home Manager Flake for Arch Linux with KDE";

  inputs = {
    nixpkgs = {
      url = "nixpkgs/nixos-24.11";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # Intended to be used on Arch. Packages that are not covered by this file.
  # All 'system' packages including anything in `make arch-packages`
  # steam (which requires a large pile of multilib dependencies on arch and therefore should not be installed at user level).
  # All the KDE apps because are better to use with the version tied to my current KDE: `make kde-packages`

  outputs = { nixpkgs, home-manager, ... }:
  let
    # lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    homeConfigurations = {
      home = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home.nix
        ];

        extraSpecialArgs = {
          extra-apps = with pkgs; [
            betterdiscordctl
            cargo-nextest
            discord
            jellyfin-media-player
            qbittorrent
            rustup
            tailscale
            telegram-desktop
            # timeshift
            yt-dlp
            zoom
            z3
          ];
          extra-options = {
            github ={
              email = "aislingheanue@gmail.com";
              username = "AislingArch";
            };
            steam-enabled = true;
          };
        };
      };
    };
  };
}
            # ./zsh.nix
            # ./nvim.nix
            # ./plasma.nix
            # ./apps.nix
            # ./home/plasma.nix # panel config, mainly
            # ./work/plasma.nix # panel config, mainly
            # ./secrets.nix
            # where do i toss work aliases? I guess those don't get put here?
            # other synced stuff to throw in home for now: kitty, tmux, tmux scripts, dircolors,
            # also wallpaper and kitty wallpaper are different make sure to have a flag for that for the 2 homeConfigs


            # Add machine-specific configs here (e.g., ./hosts/default.nix)
      # ];

