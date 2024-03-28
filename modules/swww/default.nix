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
      ExecStart = toString (
        pkgs.writeShellScript "swww-random-wallpaper.sh" ''
          wallpapers=${config.users.users.adaad.home}/wallpapers

          if [ ! -d $wallpapers ]; then
              echo "No wallpapers directory found at $wallpapers"
              exit 1
          fi

          statedir="${config.users.users.adaad.home}/.local/state/randomwal"
          lastfind="$statedir/lastfind"
          queue="$statedir/queue"

          if [ ! -d $statedir ]; then
              mkdir -p $statedir
          fi

          find_wal() {
              find "$wallpapers" -not -path "*/.*" -type f
          }


          if [ ! -s $queue ]; then
              find_wal > $lastfind
              shuf $lastfind > $queue
          fi

          nextwallpaper=$(head -n 1 $queue)
          sed -i '1d' $queue

          ${pkgs.unstable.swww}/bin/swww img "$nextwallpaper" --transition-type any
        ''
      );
    };
  };
}
