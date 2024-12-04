{ config, lib, pkgs, ... }:

{

  # Misc
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nix.settings.auto-optimise-store = true;
  boot.loader.systemd-boot.configurationLimit = 3;

  # Environment
  environment.variables.EDITOR = "vim";
  environment.systemPackages = with pkgs; [
    git
nixfmt-rfc-style
    vim
    wget
  ];

}
