#!/bin/bash

# nvim setup
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
cp -r ./nvim ~/.config/nvim

# tmux setup
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

cp ./tmux/tmux.conf ~/.tmux.conf
cp -r ./tmux/tmux_dir ~/.tmux
