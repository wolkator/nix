{ config, lib, pkgs, ... }:

{

  # Misc
  environment.pathsToLink = ["/libexec"];

  # i3
  services.xserver = {
	enable = true;
    desktopManager = {
      xterm.enable = false;
    };
  displayManager.lightdm.background = "#000000";
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        i3status
	rofi
      ];
    };
  };
  services.displayManager = {
    defaultSession = "none+i3";
  };

}
