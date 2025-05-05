#!/bin/bash
other=$(pacman -Qem)

original_installed=$(echo -n ~/.local/share/chezmoi/.chezmoidata/installed.yaml | sha256sum | cut -d" " -f1)

echo "packages:" > ~/.local/share/chezmoi/.chezmoidata/installed.yaml
echo "  pacman:" >> ~/.local/share/chezmoi/.chezmoidata/installed.yaml
echo "    installed:" >> ~/.local/share/chezmoi/.chezmoidata/installed.yaml
while IFS= read -r line; do
  cutLine=$(echo $line | cut -d" " -f1)
  echo "      - $cutLine" >> ~/.local/share/chezmoi/.chezmoidata/installed.yaml
done < <(pacman -Qen)
echo "  yay:" >> ~/.local/share/chezmoi/.chezmoidata/installed.yaml
echo "    installed:" >> ~/.local/share/chezmoi/.chezmoidata/installed.yaml
while IFS= read -r line; do
  cutLine=$(echo $line | cut -d" " -f1)
  echo "      - $cutLine" >> ~/.local/share/chezmoi/.chezmoidata/installed.yaml
done < <(pacman -Qem)

new_installed=$(echo -n ~/.local/share/chezmoi/.chezmoidata/installed.yaml | sha256sum | cut -d" " -f1)

if [ $original_installed != $new_installed ]; then
  echo "WARNING: package list has changed since last apply. Run apply again to sync changes."
fi
