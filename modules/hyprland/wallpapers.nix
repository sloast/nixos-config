{config, ...}: {
  systemd.timers."random-wallpaper" = {
    wantedBy = ["timers.target"];
    timerConfig = {
      OnBootSec = "5m";
      OnUnitActiveSec = "5m";
      Unit = "random-wallpaper.service";
    };
  };

  systemd.services."random-wallpaper" = {
    script = ''
      swww-random.sh || true
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "adaad";
    };
  };
}
