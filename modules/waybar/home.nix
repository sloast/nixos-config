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
        "hyprland/language"
        "hyprland/window"
      ];

      module-center = [
        "custom/media"
        "mpd"
      ];

      modules-right = [
        "tray"
        "idle_inhibitor"
        "pulseaudio"
        "network"
        "power-profiles-daemon"
        "cpu"
        #"memory"
        "temperature"
        "backlight"
        "keyboard-state"
        "battery"
        "battery#bat2"
        "clock"
      ];

      "hyprland/workspaces" = {
        format = "{icon}{name}";
        format-icons = {
          "1" = " ";
          "2" = " ";
          "3" = " ";
          "4" = " ";
          "discord" = "󰙯 ";
          urgent = " ";
          #active = " ";
          default = " ";
        };
      };

      "custom/nix-logo" = {
        format = " NixOS";
        #on-click = "${pkgs.wofi}/bin/wofi --show drun";
        tooltip = false;
      };

      "hyprland/language" = {
        format = "🇬🇧";
      };

      "battery" = {
        states = {
          good = 50;
          warning = 30;
          critical = 15;
        };
        format = "{icon} {capacity}%";
        format-charging = "  {capacity}% ({time})";

        format-icons = [" " " " " " " " " "];
      };

      "battery#bat2" = {
        bat = "BAT2";
      };

      "tray" = {
        icon-size = 20;
        spacing = 10;
      };

      "idle_inhibitor" = {
        format = "{icon}";
        format-icons = {
          deactivated = " ";
          activated = " ";
        };
        tooltip = false;
      };

      "network" = {
        # "interface": "wlp2*"; // (Optional) To force the use of this interface
        format-wifi = "{essid}   {signalStrength}%";
        format-ethernet = "{ipaddr}/{cidr} ";
        tooltip-format = "{ifname} via {gwaddr} ";
        format-linked = "{ifname} (No IP) ";
        format-disconnected = "Disconnected ⚠";
        format-alt = "{ifname}: {ipaddr}/{cidr}";
      };

      "cpu" = {
        format = " {usage}%";
      };

      "memory" = {
        format = "🐏 {}%";
      };

      "temperature" = {
        critical-threshold = 80;
        format = " {temperatureC}°C";
      };

      "backlight" = {
        format = "{icon} {percent}%";
        format-icons = ["" "" "" "" "" "" "" "" ""];
      };

      "pulseaudio" = {
        # "scroll-step": 1, // %, can be a float
        format = "{volume}% {icon} {format_source}";
        format-bluetooth = "{volume}% {icon} {format_source}";
        format-bluetooth-muted = "󰝟  {format_source}";
        format-muted = "󰝟 {format_source}";
        format-source = ""; # "{volume}% ";
        format-source-muted = "";
        format-icons = {
          headphone = "";
          #hands-free = "";
          #headset = "";
          phone = "";
          portable = "";
          car = "";
          default = ["" "" ""];
          muted = "󰝟";
        };
        on-click = "pavucontrol";
      };
    };

    style = builtins.readFile ./style.css;
  };
}
