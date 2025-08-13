#!/bin/sh

config="$HOME/.config"

# Fastfetch
mkdir -p $config/fastfetch
cp fastfetch/config.jsonc $config/fastfetch

mkdir -p programs/scripts/

# Sxwm
cp xorg/sxwm/sxwmrc $config/

# Polybar
mkdir -p $config/polybar
cp xorg/polybar/config.ini $config/polybar

# Bash and Zsh
cp shells/.bashrc $HOME/.bashrc
cp shells/.zshrc  $HOME/.zshrc

echo "Setup Complete"
