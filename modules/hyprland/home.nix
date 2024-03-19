{config, ...}: {
  home.file.".config/hypr" = {
    source = ./hypr;
    recursive = true;
  };

  home.file.".local/bin" = {
    source = ./bin;
    recursive = true;
  };
}
