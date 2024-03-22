{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    neofetch
    hyfetch
    fastfetch
  ];
}
