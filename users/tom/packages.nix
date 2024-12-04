{ config, pkgs, ... }:

{
  # Packages
  home.packages = with pkgs; [
	alacritty
	tmux
	neovim

	bat
	eza
	fd
	file
	fzf
	nnn
	ripgrep
	zip
	unzip
	which
	xsel

	nerd-fonts.jetbrains-mono

	btop
	htop
	neofetch

	firefox
	distrobox
	megasync

	cargo
	clang
	(hiPrio gcc)
	gh
	python3
  ];

}
