{ config, lib, pkgs, ... }:

{

  # Misc
  nixpkgs.config.allowUnfree = true;

  # GPU
  hardware.graphics = {
    enable = true;
  };
  services.xserver = {
    videoDrivers = ["nvidia"];
  };
  hardware.nvidia-container-toolkit.enable = true;
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
  environment.systemPackages = with pkgs; [
    nvidia-container-toolkit
  ];

}
