{
  description = "My Home Manager Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-23.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # Intended to be used on Arch. Also make sure to install
  # plasma-meta
  # kde-system-meta
  # base-devel
  # networkmanager
  # nvidia
  # nvidia-prime if needed

  outputs = { nixpkgs, home-manager, ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      homeConfigurations = {
        home = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./home.nix {
              settings = {
                github = {
                  email = "aislingheanue@gmail.com";
                  username = "AislingArch";
                };
                extra_apps = [
                  # jellyfin-media-player
                  # qbittorrent
                  # rustup
                  # steam
                  # timeshift
                  # vencord
                ];
              };
            }
          ];
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
        };
      };
  };
}

