#! /bin/bash

cp ~/.yabairc ./yabai/yabairc
cp ~/.skhdrc ./skhd/skhdrc
cp -R ~/.config/sketchybar ./
cp ~/.tmux.conf ./tmux/tmux.conf
cp -R ~/.config/alacritty ./

# nvim related
cp -R ~/.config/nvim ./
echo "lazy-lock.json" > ./nvim/.gitignore
