{ lib, pkgs, settings, ... }:

{
  home = {
    username = "aisling";
    homeDirectory = "/home/aisling";

    home.packages = with pkgs; [
      hello
      # atuin
      # bat
      # btop
      # cmatrix
      # docker
      # # docker-compose
      # eza
      # find
      # fzf
      # go
      # gofumpt
      # golangci-lint
      # gparted
      # hunspell
      # neovim
      # ripgrep
      # tmux
      # wget
      # zoxide
      #
      # kitty
      # chromium
      # vlc
      # xournalpp
      #
      # kdePackages = [
      #   ark
      #   filelight
      #   gwenview
      #   kamoso
      #   kate
      #   kcolorchooser
      #   kolourpaint
      #   okular
      #   spectacle
      # ]


    ] ++ settings.extra_apps;

    stateVersion = "23.11";
  }
  # Your existing Home Manager config

  programs.git = {
    enable = true;
    userName = settings.username;
    userEmail = settings.email;
  };


  # Enable Home Manager
  programs.home-manager.enable = true;
}
