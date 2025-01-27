.PHONY: update
update:
	home-manager switch --flake .#home

.PHONY: clean
clean:
	nix-collect-garbage -d

.PHONY: arch-packages
arch-packages: kde-packages
	@echo Installing required system packages...
	@sudo pacman -Syy --needed base-devel kde-system-meta nvidia nvidia-prime sddm plasma-meta networkmanager

	@echo Adding user to Nix user group.
	@sudo usermod -aG nix-users ${USER}

	@echo Installed Nix, please restart to apply changes.

.PHONY: kde-packages
kde-packages:
	@sudo pacman -Syy --needed ark filelight gwenview kamoso kate kcolorchooser kolourpaint okular spectacle

.PHONY: nix-channels
bootstrap:
	@nix-channel --add https://github.com/nix-community/home-manager/archive/release-24.11.tar.gz home-manager
	@nix-channel --add https://nixos.org/channels/nixos-24.11 nixpkgs
	@nix-channel --update
	@nix-shell '<home-manager>' -A install

	@home-manager switch --flake .#home
