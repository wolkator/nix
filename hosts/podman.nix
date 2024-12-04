{ config, lib, pkgs, ... }:

{

  # Podman
virtualisation.containers.enable = true;
virtualisation = {
  podman = {
    enable = true;
    dockerCompat = true;
    defaultNetwork.settings.dns_enabled = true;
  };
};

}
