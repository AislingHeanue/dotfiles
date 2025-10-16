# Chezmoi dotfiles

Quick start for new device:

Prerequisite: install chezmoi

```sh
chezmoi init github.com/AislingHeanue/dotfiles
chezmoi cd
# Temporarily disable the install-packages script until the first run is completed successfully
mv ./run_onchange_install-packages.sh.tmpl extra
chezmoi apply
mv extra/run_onchange_install-packages.sh.tmpl .
# This should install ~300 new packages
chezmoi apply

# Launch `nvim` with `vi`
sudo ln -s /usr/bin/nvim /usr/bin/vi
chsh -s /usr/bin/zsh

# Reboot to apply chsh
reboot
```

Window management stuff is almost entirely configured using `konsave`, which is an alternative to chezmoi for KDE
config files, and should be copied over manually for each new installation (config files not provided here).
