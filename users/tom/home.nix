{ config, pkgs, ... }:

{

  # User
  home.username = "tom";
  home.homeDirectory = "/home/tom";

	imports = [
		./packages.nix
		./config.nix
	];

  # Shell
	programs.fish = {
		enable = true;
		plugins = [
		{ name = "pure"; src = pkgs.fishPlugins.pure.src; }
		];
		shellAbbrs = {
			e = "eza -1l";
		};
	};
home.sessionVariables = {
	pure_color_success = "green";
};

  # Git
  programs.git = {
    enable = true;
    userName = "Tomasz Woloszynski";
    userEmail = "tomekwoloszynski@gmail.com";
  };

# Rofi
programs.rofi = {
	enable = true;
	terminal = "alacritty";
	theme = "gruvbox-dark-soft.rasi";
};

# Tmux
	programs.tmux = {
enable = true;
plugins = [pkgs.tmuxPlugins.cpu pkgs.tmuxPlugins.sensible];
extraConfig = (builtins.readFile ./dotfiles/tmux/tmux.conf);
};

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;

}
