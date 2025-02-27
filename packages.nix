{
  config,
  pkgs,
  personalProfile,
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
    ]
    ++ (
      if personalProfile then
        [
          betterdiscordctl
          cargo-nextest
          rustup
          yt-dlp
          z3

          telegram-desktop
          qbittorrent
          (config.lib.nixGL.wrap obs-studio)
        ]
      else
        [
          (config.lib.nixGL.wrap jetbrains.idea-ultimate)
          (config.lib.nixGL.wrap teams)
          slack
        ]
    );
}
