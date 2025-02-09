{
  pkgs,
  nixgl,
  username,
  homeDirectory,
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
    inherit username;
    inherit homeDirectory;
    stateVersion = "24.11";
  };

  news.display = "silent";
}
