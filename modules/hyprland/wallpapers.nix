{config, ...}: {
  systemd.timers."random-wallpaper" = {
    wantedBy = ["timers.target"];
    timerConfig = {
      OnBootSec = "10";
      OnUnitActiveSec = "10";
      Unit = "random-wallpaper.service";
    };
  };

  systemd.services."random-wallpaper" = {
    script = ''
      /usr/bin/env bash swww-random.sh
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "adaad";
    };
  };
}
