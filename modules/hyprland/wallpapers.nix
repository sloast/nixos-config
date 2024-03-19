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
    script = ''
      swww-random.sh
    '';
    serviceConfig = {
      Type = "oneshot";
    };
  };
}
