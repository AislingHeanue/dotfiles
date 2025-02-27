.PHONY: update
update:
	home-manager switch --flake .#personal

.PHONY: clean
clean:
	nix-collect-garbage -d

.PHONY: arch-packages
arch-packages: kde-packages
	@echo Installing required system packages...
	@sudo pacman -Syy --needed \
		appmenu-gtk-module \
		base \
		base-devel \
		chromium \
		docker \
		docker-compose \
		gparted \
		grub \
		grub-customizer \
		ipython \
		kde-system-meta \
		konsole \
		libva-intel-driver \
		linux \
		linux-headers \
		linux-firmware \
		make \
		markdownlint \
		networkmanager \
		noto-fonts-cjk \
		noto-fonts-emoji \
		ntfs-3g \
		nvidia \
		nvidia-prime \
		nvidia-settings \
		os-prober \
		pipewire-alsa \
		pipewire-pulse \
		plasma-meta \
		python \
		python-matplotlib \
		python-pip \
		python-pynvim \
		python-setuptools \
		sddm \
		sudo \
		tailscale \
		timeshift \
		ttf-dejavu-nerd \
		vim \
		wacomtablet \
		wayland \
		xf86-input-synaptics \
		xorg-xwayland \
		zsh

	@echo Adding user to Nix user group.
	@sudo usermod -aG nix-users ${USER}

	@echo Adding user to the Docker group
	@sudo usermod -aG docker ${USER}

.PHONY: kde-packages
kde-packages:
	@sudo pacman -Syy --needed \
		ark \
		filelight \
		gwenview \
		hunspell \
		hunspell-en_gb \
		kamoso \
		kate \
		kcolorchooser \
		kolourpaint \
		okular \
		spectacle

.PHONY: nix-channels
bootstrap: arch-packages
	@nix-channel --add https://github.com/nix-community/home-manager/archive/release-24.11.tar.gz home-manager
	@nix-channel --add https://nixos.org/channels/nixos-24.11 nixpkgs
	@nix-channel --update
	@nix-shell '<home-manager>' -A install

	@~/.nix-profile/bin/home-manager --extra-experimental-features 'nix-command flakes' switch --flake .#personal
	@source ~/.nix-profile/etc/profile.d/hm-session-vars.sh
