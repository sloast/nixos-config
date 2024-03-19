{config, ...}: {
  home.file."wallpapers" = {
    source = ./default_wallpapers;
    recursive = true;
  };
}
