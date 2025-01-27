{ lib, pkgs, extra-apps, extra-options, ... }: {
  home = {
    username = "aisling";
    homeDirectory = "/home/aisling";

    packages = with pkgs; [
      atuin
      bat
      btop
      cmatrix
      eza
      fd
      fzf
      git
      github-cli
      go
      gofumpt
      golangci-lint
      home-manager
      lazygit
      less
      luarocks
      man
      neovim
      neofetch
      strace
      tinygo
      tldr
      tree
      tmux
      unzip
      wget
      yq
      zoxide

      gparted
      obs-studio
      xournalpp
    ] ++ extra-apps;

    stateVersion = "24.11";
  };
  news.display = "silent";
}
