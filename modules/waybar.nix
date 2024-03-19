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

      "tray" = {
        "icon-size" = 20;
        "spacing" = 10;
      };
    };

    style = ''
      @define-color bg-hover #1A1A28;
      @define-color bg #1E1E2E;
      @define-color blue #89B4FA;
      @define-color sky #89DCEB;
      @define-color red #F38BA8;
      @define-color pink #F5C2E7;
      @define-color lavender #B4BEFE;
      @define-color rosewater #F5E0DC;
      @define-color flamingo #F2CDCD;
      @define-color fg #D9E0EE;
      @define-color green #A6E3A1;
      @define-color dark-fg #161320;
      @define-color peach #FAB387;
      @define-color border @lavender;
      @define-color gray2 #6E6C7E;
      @define-color black4 #575268;
      @define-color black3 #302D41;
      @define-color maroon #EBA0AC;

      * {
        margin: 0px;
        padding-left: 5px;
        padding-right: 5px;
        border-radius: 5px;
        font-family: "FiraCode NerdFont", "SF Pro", "JetBrainsMono Nerd Font";
        font-size: 13pt;
      }

      window#waybar {
        background-color: @bg;
        box-shadow: 0px 0px 10px 0px @border;
        border-radius: 0px;
        border: 0px;
        padding: 4px;
        margin: 0px
      }
    '';
  };
}
