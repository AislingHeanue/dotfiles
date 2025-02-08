{
  config,
  pkgs,
  homeProfile,
  ...
}:
{
  home.packages =
    with pkgs;
    [
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
      nixfmt-rfc-style
      strace
      tinygo
      tldr
      tree
      tmux
      unzip
      wget
      yq
      zoxide

      xournalpp
      (config.lib.nixGL.wrap kitty)
    ]
    ++ (
      if homeProfile then
        [
          betterdiscordctl
          cargo-nextest
          rustup
          yt-dlp
          z3

          discord
          telegram-desktop
          qbittorrent
          (config.lib.nixGL.wrap obs-studio)
        ]
      else
        [ ]
    );
}
