{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    brillo
    unstable.hyprland
    swaylock
    unstable.swww
    waybar
    wofi
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

  services.xserver.enable = true;
  services.xserver.displayManager = {
    sddm = {
      enable = true;
      #wayland.enable = true;
      settings = {
      };
    };
    defaultSession = "hyprland";
  };

  #  services.greetd = {
  #    enable = true;
  #    settings = rec {
  #      initial_session = {
  #        command = "Hyprland";
  #        user = "adaad";
  #      };
  #      default_session = initial_session;
  #    };
  #  };

  # brillo
  #services.udev.extraRules = ''
  #  RUN+="chgrp video /sys/class/backlight/intel_backlight/brightness"
  #  RUN+="chmod g+w /sys/class/backlight/intel_backlight/brightness"
  #'';
}
