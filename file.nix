{
  config,
  personalProfile,
  dotfilesDir,
  ...
}:
{
  home.file =
    builtins.mapAttrs
      (name: value: {
        source =
          if (value ? link && value.link) then
            config.lib.file.mkOutOfStoreSymlink "${dotfilesDir}/home/${name}"
          else
            ./home + "/${name}";
        recursive = (value ? recursive && value.recursive);
      })
      {
        ".config/Code/User/keybindings.json" = {
          link = true;
        };
        ".config/kitty" = {
          link = true;
          recursive = true;
        };
        ".config/nvim" = {
          link = true;
          recursive = true;
        };
        ".config/xournalpp" = {
          link = true;
          recursive = true;
        };
        ".dircolors" = { };
        ".tmux.conf" = {
          link = true;
        };
        ".vimrc" = {
          link = true;
        };
        ".zshrc" = {
          link = true;
        };
        ".zshenv" = {
          link = true;
        };
        "scripts/tmux.sh" = {
          link = true;
        };
      }
    // {
      "Pictures/Wallpapers/Kitty Wallpaper.jpg".source = (
        if personalProfile then
          ./home/Pictures/Wallpapers/hacknet.jpg
        else
          ./home/Pictures/Wallpapers/hacknet3.jpg
      );
    };
}
