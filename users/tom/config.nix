{ config, pkgs, ... }:

{
  xdg.configFile."" = {
	recursive = true;
	source = ./config;
  };

}
