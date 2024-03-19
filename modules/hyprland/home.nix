{config, ...}: {
  home.file.".config/hypr/hyprland.conf" = {
    source = ./hyprland.conf;
  };

  home.file.".local/bin/lock.sh" = {
    source = ./bin/lock.sh;
  };
}
