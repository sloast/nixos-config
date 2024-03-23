{
  config,
  pkgs,
  ...
}: {
  services.xserver.enable = true;
  services.xerver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  environment.plasma5.excludePackages = with pkgs.libsForQt5; [
    plasma-browser-integration
    konsole
    oxygen
  ];
}
