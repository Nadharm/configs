#!/bin/bash

rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim

cp -r ./nvim ~/.config/nvim
cp ./tmux/tmux.conf ~/.tmux.conf
