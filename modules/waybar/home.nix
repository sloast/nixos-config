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
      ];

      modules-right = [
        "tray"
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
        format = " NixOS";
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
        "format-charging" = "  {capacity}% ({time})";

        "format-icons" = ["" "" "" "" ""];
      };

      "battery#bat2" = {
        "bat" = "BAT2";
      };

      "tray" = {
        "icon-size" = 20;
        "spacing" = 10;
      };

      "idle_inhibitor" = {
        "format" = "{icon}";
        "format-icons" = ["" ""];
      };

      "cpu" = {
        "format" = "  {usage}%";
      };

      "memory" = {
        "format" = "🐏 {usage}%";
      };

      "temperature" = {
        "critical-threshold" = 80;
        "format" = "  {temp}°C";
      };

      "backlight" = {
        "format" = "{icon}  {percentage}%";
        "format-icons" = ["" "" "" "" "" "" "" "" ""];
      };

      "pulseaudio" = {
        # "scroll-step": 1, // %, can be a float
        "format" = "{volume}% {icon} {format_source}";
        "format-bluetooth" = "{volume}% {icon} {format_source}";
        "format-bluetooth-muted" = " {icon} {format_source}";
        "format-muted" = " {format_source}";
        "format-source" = "{volume}% ";
        "format-source-muted" = "";
        "format-icons" = {
          "headphone" = "";
          #"hands-free" = "";
          #"headset" = "";
          "phone" = "";
          "portable" = "";
          "car" = "";
          "default" = ["" "" ""];
        };
        "on-click" = "pavucontrol";
      };
    };

    style = builtins.readFile ./style.css;
  };
}
