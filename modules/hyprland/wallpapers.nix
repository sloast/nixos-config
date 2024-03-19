{
  config,
  lib,
  pkgs,
  ...
}: {
  systemd.user.timers."random-wallpaper" = {
    wantedBy = ["timers.target"];
    timerConfig = {
      OnBootSec = "10";
      OnUnitActiveSec = "10";
      Unit = "random-wallpaper.service";
    };
  };

  systemd.user.services."random-wallpaper" = {
    serviceConfig = {
      Type = "oneshot";
      User = "adaad";
      ExecStart = toString (
        pkgs.writeShellScript "swww-random-wallpaper.sh" ''
          wallpapers=${config.users.users.adaad.home}/wallpapers

          selection=$(ls $wallpapers | shuf -n 1)

          swww img "$wallpapers/$selection" -t any
        ''
      );
    };
  };
}
