#! /bin/bash
# Sync Script for nerdywoffy/dotfiles
# Modeline {
#	 vi: foldmarker={,} foldmethod=marker foldlevel=0 tabstop=4 filetype=sh
# }

# yabai (macOS only) {
	cp ~/.yabairc ./yabai/yabairc
# }

# skhd (macOS only) {
	cp ~/.skhdrc ./skhd/skhdrc
# }

# sketchybar (macOS only) {
	cp -R ~/.config/sketchybar ./
# }

# tmux (macOS/win/linux) {
	cp -R ~/.config/tmux ./
	cp -R ~/.config/tmux-powerline ./

	# Ignore tpm plugins folder
	printf 'plugins' > ./tmux/.gitignore
# }

# alacritty (macOS/win/linux) {
	cp -R ~/.config/alacritty ./
# }

# nvim (macOS/win/linux) {
	cp -R ~/.config/nvim ./
	echo "lazy-lock.json" > ./nvim/.gitignore
# }
