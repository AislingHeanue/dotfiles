{
  pkgs,
  nixgl,
  ...
}:
{
  nixGL = {
    packages = nixgl.packages;
    defaultWrapper = "mesa";
    offloadWrapper = "nvidiaPrime";
    installScripts = [
      "mesa"
      "nvidiaPrime"
    ];
  };

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
    stateVersion = "24.11";
  };

  news.display = "silent";
}
