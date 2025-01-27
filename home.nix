{ lib, pkgs, extra-apps, extra-options, ... }:

{
  home = {
    username = "aisling";
    homeDirectory = "/home/aisling";


    packages = with pkgs; [
      atuin
      bat
      btop
      cmatrix
      home-manager
      eza
      fzf
      go
      gofumpt
      fd

      gparted
    ] ++ extra-apps;
      # docker
    #   # docker-compose
    #   golangci-lint
    #   hunspell
    #   neovim
    #   ripgrep
    #   tmux
    #   wget
    #   zoxide
    #
    #   kitty
    #   chromium
    #   vlc
    #   xournalpp
    #
    #
    # ];
    # ] ++ settings.extra_apps;

    stateVersion = "24.11";
  };
  # Your existing Home Manager config

  # programs.git = {
  #   enable = true;
  #   userName = settings.username;
  #   userEmail = settings.email;
  # };

}
