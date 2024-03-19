{pkgs, ...}: let
  light = "${pkgs.light}/bin/light";
  wpctl = "${pkgs.wireplumber}/bin/wpctl";
in {
  programs.waybar = {
    enable = true;

    settings.mainBar = {
      position = "top";
      layer = "top";

      height = 30;
      spacing = 4;

      modules-left = [
        "custom/nix-logo"
        "hyprland/workspaces"
        "hyprland/window"
        "hyprland/language"
        "custom/media"
      ];

      module-center = [
        "tray"
      ];

      modules-right = [
        "mpd"
        "idle_inhibitor"
        "pulseaudio"
        "network"
        "power-profiles-daemon"
        "cpu"
        "memory"
        "temperature"
        "backlight"
        "keyboard-state"
        "battery"
        "battery#bat2"
        "clock"
      ];

      "custom/nix-logo" = {
        format = "";
        on-click = "${pkgs.wofi}/bin/wofi --show drun";
        tooltip = false;
      };

      "battery" = {
        "states" = {
          "good" = 50;
          "warning" = 30;
          "critical" = 15;
        };
        "format" = "{icon}  {capacity}%";
        "format-charging" = " {capacity}% ({time})";

        "format-icons" = ["" "" "" "" ""];
      };

      "battery#bat2" = {
        "bat" = "BAT2";
      };
    };
  };
}
