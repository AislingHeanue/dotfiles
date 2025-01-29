{
  config,
  pkgs,
  nixgl,
  plasma-manager,
  homeProfile,
  ...
}:
{
  imports = [ plasma-manager.homeManagerModules.plasma-manager ];

  nixGL.packages = nixgl.packages;
  nixGL.defaultWrapper = "mesa";
  nixGL.offloadWrapper = "nvidiaPrime";
  nixGL.installScripts = [
    "mesa"
    "nvidiaPrime"
  ];

  nix = {
    package = pkgs.nix;
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  home = {
    username = "aisling";
    homeDirectory = "/home/aisling";

    packages =
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

    stateVersion = "24.11";
  };

  news.display = "silent";
}
