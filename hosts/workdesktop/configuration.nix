{ config, lib, pkgs, ... }:

{
  # Modules
  imports =
    [
        ./hardware-configuration.nix
	../system.nix
	../nvidia.nix
	../i3.nix
	../podman.nix
    ];

  # Mist
environment.pathsToLink = ["/share/xdg-desktop-portal" "/share/applications"];

  # Boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Network
  networking.hostName = "workdesktop";
  networking.networkmanager.enable = true;

  # Localisation
  time.timeZone = "Australia/Perth";
  i18n.defaultLocale = "en_AU.UTF-8";

  # Sound
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # User
  users.users.tom = {
    isNormalUser = true;
    extraGroups = ["wheel" "podman"];
    shell = pkgs.fish;
  };

services.flatpak.enable = true;
xdg.portal.enable = true;
xdg.portal.config = {
	common = { default = ["gtk"]; };
};
xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];


  programs.fish.enable = true;

  system.stateVersion = "24.11";

}
