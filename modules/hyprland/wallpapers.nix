{
  config,
  lib,
  pkgs,
  ...
}: {
  systemd.user.timers."random-wallpaper" = {
    wantedBy = ["timers.target"];
    timerConfig = {
      OnBootSec = "10m";
      OnUnitActiveSec = "10m";
      Unit = "random-wallpaper.service";
    };
  };

  systemd.user.services."random-wallpaper" = {
    serviceConfig = {
      Type = "oneshot";
      #User = "adaad";
      ExecStart = toString (
        pkgs.writeShellScript "swww-random-wallpaper.sh" ''
          wallpapers=${config.users.users.adaad.home}/wallpapers

          selection=$(ls $wallpapers | shuf -n 1)

          ${pkgs.unstable.swww}/bin/swww img "$wallpapers/$selection" -t any
        ''
      );
    };
  };
}
