{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    unstable.hyprland
    swaylock
    unstable.swww
    waybar
    wlroots
    wl-clipboard
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    xdg-utils
    xwayland
    unstable.xwaylandvideobridge
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  programs.waybar = {
    enable = true;
  };

  # swaylock
  # https://discourse.nixos.org/t/swaylock-wont-unlock/27275
  security.pam.services.swaylock = {};
  security.pam.services.swaylock.fprintAuth = false;

  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "Hyprland ; swaylock";
        user = "adaad";
      };
      default_session = initial_session;
    };
  };
}
